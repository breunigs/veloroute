let videoCoords = null;
let prevVideo = null;
let prevStartGen = null;
let hlsAutoStartLoad = false;
let prevLevel = null;

const video = document.getElementById('videoInner');
video.addEventListener('loadedmetadata', seekToStartTime);
video.addEventListener('loadedmetadata', updateIndicatorPos);
video.addEventListener('timeupdate', updateIndicatorPos);
video.addEventListener('play', markPlay);
video.addEventListener('pause', markPause);


function reverseVideo() {
  window.pushEvent('video-reverse', {
    lon: window.state.lon,
    lat: window.state.lat
  })

  window.plausible('video-reverse', {
    props: {
      hash: state.videoHash
    }
  })
}

function autoplayEnabled() {
  return window.state.autoplay === "true"
}

function maybeMarkAutoplayed() {
  if (autoplayEnabled()) {
    console.debug("autoplay is enabled, but we played, disabling it")
    window.pushEvent('video-autoplayed', {})
  }
}

function markPlay() {
  window.plausible('video-play', {
    props: {
      hash: state.videoHash
    }
  })
}

function markPause() {
  window.pushEvent('video-pause', {
    pos: Math.round(this.currentTime * 1000)
  })

  window.plausible('video-pause', {
    props: {
      hash: state.videoHash
    }
  })
}

function attachHlsErrorHandler(obj, Hls) {
  obj.on(Hls.Events.ERROR, function (event, data) {
    if (data.fatal) {
      console.warn('Hls encountered a fatal error. Destroying it and letting the browser use one of the fallbacks.', event, data);
      window.hls = false;
      obj.destroy();
      updateVideoElement();
      window.plausible('video-hls-error-fatal');
    } else {
      console.log('Hls encountered an error', event, data);
      window.plausible('video-hls-error');
    }
  });
}

function updateVideoElement() {
  if (!state.videoHash) return;
  console.debug('trying to play video for: ', state.videoHash)
  const path = `/videos-rendered/${state.videoHash}/`;

  if (video.canPlayType('application/vnd.apple.mpegurl')) {
    console.debug('native hls, doing nothing?')
  } else if (window.hls === false || typeof Promise === "undefined") {
    console.debug('hls.js not supported, using fallback')
  } else {
    console.debug('no native hls, trying to load hls.js')
    import('hls.js').then(Hls => {
      if (!Hls.isSupported()) return window.hls = false;
      console.debug('loading hls video stream');
      Hls = Hls.default;

      let options = {
        autoStartLoad: hlsAutoStartLoad || !video.paused || autoplayEnabled(),
        enableWebVTT: false,
        maxBufferLength: 10, // seconds
        maxMaxBufferLength: 30, // seconds
      };

      prevLevel = null;

      if (window.hls) {
        const currentLevel = window.hls.abrController.getNextABRAutoLevel();
        // keep current level if the quality is good enough, otherwise re-estimate
        if (typeof currentLevel === "number" && currentLevel >= 3) {
          options.startLevel = currentLevel;
          options.testBandwidth = false;
          console.debug("setting startLevel to previously used level", currentLevel);
          prevLevel = options.startLevel;
        }

        // don't leak previous instance
        window.hls.destroy();
      }

      window.hls = new Hls(options);
      window.hls.attachMedia(video);
      attachHlsErrorHandler(hls, Hls);
      window.hls.on(Hls.Events.MANIFEST_PARSED, seekToStartTime);
      window.hls.on(Hls.Events.LEVEL_SWITCHED, maybeUpgradeLowQualitySegments)
      window.hls.loadSource(`${path}stream.m3u8`);
      video.addEventListener('play', () => {
        if (hlsAutoStartLoad) return;
        console.debug("triggering hls.startLoad");
        hlsAutoStartLoad = true;
        window.hls.startLoad(-1);
        maybeMarkAutoplayed();
      });
    })
    return
  }

  console.debug('loading regular html video')
  const time = `#t=${state.videoStart / 1000.0}`;
  // codec version for h264 can be determined through (Debian package: gpac)
  // MP4Box -info fallback.mp4 2>&1 | grep RFC6381 | awk '{print $4}'
  const innerHTML = `
    <source src="${path}stream.m3u8${time}" type="application/x-mpegURL">
    <source src="${path}fallback.webm${time}" type="video/webm; codecs=vp9">
    <source src="${path}fallback.mp4${time}" type="video/mp4; codec=avc1.64001E">
    <p>Abspielen im Browser klappt wohl nicht. Du kannst das <a href="${path}fallback.mp4" target="_blank">Video herunterladen</a> und anderweitig anschauen.</p>
  `;
  video.innerHTML = innerHTML;
  if (autoplayEnabled()) video.load();
}

function seekToStartTime() {
  const cur = currentTimeInMs();
  const auto = autoplayEnabled();

  if (Math.abs(cur - state.videoStart) < 100 || prevStartGen == state.videoStartGen) {
    video.autoplay = auto;
    return;
  }
  console.debug("seeking to", state.videoStart, "(from ", cur, ")");
  if (!auto) video.pause();
  seekToTime(state.videoStart);
  video.autoplay = auto;
  prevStartGen = state.videoStartGen;
}

function currentTimeInMs() {
  if (!video) return 0;
  return Math.round(video.currentTime * 1000);
}

function seekToTime(timeInMs) {
  const seconds = timeInMs / 1000.0;
  if (video.currentTime == seconds) return;
  video.currentTime = seconds;
}

function setVideo() {
  if (prevVideo !== state.videoHash) {
    prevVideo = state.videoHash;
    updateVideoElement();
    videoCoords = parseCoordsFromState();
    return;
  }

  seekToStartTime();
}

function parseCoordsFromState() {
  let coords = state.videoCoords.split(" ");
  for (let i = 0; i < coords.length; i += 3) {
    coords[i] = (coords[i - 3] || 0) + coords[i] / 1000.0;
    coords[i + 1] = (coords[i - 2] || 0) + coords[i + 1] / 1000000.0;
    coords[i + 2] = (coords[i - 1] || 0) + coords[i + 2] / 1000000.0;
  }
  return coords
}

function updateIndicatorPos(evt) {
  if (!videoCoords) return;
  window.mapUpdateIndicatorFromVideo(video, videoCoords);
}

function maybeUpgradeLowQualitySegments(evt, info) {
  const nextLevel = info.level;
  if (nextLevel <= prevLevel) {
    console.debug("quality downgraded from", prevLevel, "to", nextLevel, " -- keeping back buffer segments");
    prevLevel = nextLevel;
    return
  }

  console.debug("quality upgraded from", prevLevel, "to", nextLevel, " -- flushing back buffer for segment quality upgrade");
  hls.bufferController.flushBackBuffer();
  prevLevel = nextLevel;
}

window.videoStateChanged = setVideo;
window.reverseVideo = reverseVideo;
setVideo()
