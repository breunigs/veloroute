let videoCoords = null;
let prevVideo = null;
let prevStartGen = null;
let hlsAutoStartLoad = false;
let prevLevel = null;

const video = document.getElementById('videoInner');
video.addEventListener('loadedmetadata', seekToStartTime);
video.addEventListener('loadedmetadata', updateIndicatorPos);
video.addEventListener('loadeddata', maybeShowLoadingIndicator);
video.addEventListener('stalled', maybeShowLoadingIndicator);
video.addEventListener('waiting', maybeShowLoadingIndicator);
video.addEventListener('playing', maybeShowLoadingIndicator);
video.addEventListener('timeupdate', updateIndicatorPos);
video.addEventListener('timeupdate', updateProgressbar);
video.addEventListener('progress', updateProgressbar);
video.addEventListener('play', markPlay);
video.addEventListener('play', updatePlaypause);
video.addEventListener('play', updateIndicatorPos);
video.addEventListener('pause', markPause);
video.addEventListener('pause', updatePlaypause);
video.addEventListener('pause', updateIndicatorPos);

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
  window.pushEvent('video-current-time', {
    pos: Math.round(this.currentTime * 1000)
  })
}

function attachHlsErrorHandler(obj, Hls) {
  obj.on(Hls.Events.ERROR, function (event, data) {
    if (data.fatal) {
      console.warn('Hls encountered a fatal error. Destroying it and letting the browser use one of the fallbacks.', event, data);
      window.hls = false;
      obj.destroy();
      updateVideoElement();
      window.plausible('video-hls-error-fatal', {
        props: data
      });
    } else {
      console.log('Hls encountered an error', event, data);
      window.plausible('video-hls-error', {
        props: {
          type: data.type,
          details: data.details,
        }
      });
    }
  });
}

function updateVideoElement() {
  if (!state.videoHash) return;
  console.debug('trying to play video for: ', state.videoHash)
  const path = `/videos-rendered/${state.videoHash}/`;
  updatePoster();

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
        lowLatencyMode: false,
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
      window.hls.on(Hls.Events.MANIFEST_PARSED, updateQualityChooser);
      window.hls.on(Hls.Events.LEVEL_SWITCHED, maybeUpgradeLowQualitySegments);
      window.hls.on(Hls.Events.LEVEL_SWITCHED, updateQualityChooser);
      window.hls.on(Hls.Events.FRAG_LOADED, recordQualityLevel);
      window.hls.on(Hls.Events.DESTROYING, hideQualityChooser);
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
  console.debug("seeking to", state.videoStart, "(from ", cur,
    ", gen", prevStartGen, "→", state.videoStartGen, ")");
  if (!auto) video.pause();
  seekToTime(state.videoStart);
  video.autoplay = auto;
  prevStartGen = state.videoStartGen;
}

const videoQuality = document.getElementById("videoQuality");
const videoQualityOptions = document.getElementById("videoQualityOptions");
videoQualityOptions.addEventListener('click', event => {
  if (!window.hls) return hideQualityChooser();

  const level = event.target.dataset.level;
  if (!level) return;
  if (video.paused || video.readyState <= 2) window.hls.currentLevel = level * 1;
  window.hls.nextLevel = level * 1;
  window.hls.loadLevel = level * 1;
  updateQualityChooser();
});

const codecTranslate = {
  avc1: "",
  hc1: " (HEVC)"
}

function updateQualityChooser() {
  if (!window.hls) return hideQualityChooser();

  const current = window.hls.currentLevel;
  const next = window.hls.loadLevel;
  const auto = window.hls.autoLevelEnabled;

  let choosers = "";
  for (let i = window.hls.levels.length - 1; i >= 0; i--) {
    let classes = "eye"
    if (current == i) classes += " active";
    if (next == i) classes += " next";
    const resolution = window.hls.levels[i].height + "p";
    const mbits = window.hls.levels[i].bitrate / 1024 / 1024;
    const codec = window.hls.levels[i].codecSet;
    const title = `${resolution} benötigt ca. ${Math.round(mbits)} MBit/s${codecTranslate[codec]}`

    choosers += `<a data-level="${i}" class="${classes}" title="${title}">${resolution}</a>`
  }
  choosers += `<a data-level="-1" class="${auto ? "active" : ""}" title="Wählt automatisch die bestmögliche Qualität. Was aktuell angezeigt wird, ist durch das Auge markiert.">automatisch</a>`

  videoQuality.style.display = 'block';
  videoQualityOptions.innerHTML = choosers;
}

function hideQualityChooser() {
  videoQuality.style.display = 'none';
}

function recordQualityLevel(_ev, data) {
  const lvl = data.frag.initSegment.level;
  const mbits = window.hls.levels[lvl].bitrate / 1024 / 1024;
  const codec = window.hls.levels[lvl].codecSet;
  window.plausible('video-quality', {
    props: {
      mbits: mbits,
      codec: codec
    }
  })
}

function currentTimeInMs() {
  if (!video) return 0;
  return Math.round(video.currentTime * 1000);
}

function seekToTime(timeInMs) {
  const seconds = Math.max(timeInMs / 1000.0, 0.0);

  if (video.currentTime == seconds) return;
  video.currentTime = seconds;
  // without this check there's a continous loop on iOS
  if (state.videoStart * 1 != Math.round(seconds * 1000)) {
    window.pushEvent('video-current-time', {
      pos: Math.round(seconds),
    })
  }
  updateProgressbar();
  updatePoster();
}

function seek(diffInMs) {
  const have = video.currentTime;
  seekToTime(have * 1000 + diffInMs)
}

function maybeShowLoadingIndicator(evt) {
  if (video.paused || video.ended || video.readyState >= 3) {
    poster.classList.remove("loading");
  } else {
    poster.classList.add("loading");
  }
}

let updatePosterTimeout = null;

function updatePoster() {
  // only update poster if we don't also have a video attached
  if (video.readyState !== 0) return;

  const setPoster = () => {
    console.debug("setting outer style img to", state.videoPoster)
    poster.style.backgroundImage = `url(${state.videoPoster})`;
  }

  const img = new Image();
  img.onload = () => {
    if (updatePosterTimeout) {
      clearTimeout(updatePosterTimeout);
      updatePosterTimeout = null;
    }
    setPoster()
  }
  img.src = state.videoPoster;

  updatePosterTimeout = setTimeout(setPoster, 750);
}

function setVideo() {
  if (prevVideo !== state.videoHash) {
    prevVideo = state.videoHash;
    updateVideoElement();
    videoCoords = parseCoordsFromState();
    return;
  }

  seekToStartTime();
  updateProgressbar();
  updatePlaypause();
  updatePoster();
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

const progress = document.getElementById("progress")
const progressWrapper = document.getElementById("progressWrapper")
const playpause = document.getElementById("playpause")
const current = document.getElementById("current")
const duration = document.getElementById("max")
const outer = document.getElementById('videoOuter')
const controls = document.getElementById('videoControls')
const poster = document.getElementById('videoPoster')
const videoOptions = document.getElementById("videoOptions")
document.getElementById('skipBackward5').addEventListener('click', () => seek(-5000))
document.getElementById('skipForward5').addEventListener('click', () => seek(+5000))
document.getElementById("reverse").addEventListener('click', reverseVideo);
document.getElementById("fullscreen").addEventListener('click', toggleFullscreen);
progressWrapper.addEventListener('click', seekFromProgress);
playpause.addEventListener('click', togglePlayPause);
poster.addEventListener('click', togglePlayPause);

// provide a way to close the options menu by clicking the gear icon again
videoOptions.addEventListener('touchstart', () => {
  const hide = window.getComputedStyle(videoQualityOptions).visibility == 'visible';
  videoOptions.classList.toggle("hidden", hide)
}, {
  passive: true
});

document.getElementById('playbackRate').addEventListener('click', event => {
  const rate = event.target.dataset.rate;
  if (!rate) return;

  video.playbackRate = rate;

  const prev = document.querySelector("#playbackRate a.active");
  if (prev) prev.classList.remove("active");
  event.target.classList.add("active");
});

let wasPlaying = false;
document.addEventListener("visibilitychange", () => {
  if (document["hidden"]) {
    wasPlaying = !video.paused;
    video.pause();
  } else {
    if (wasPlaying) video.play();
  }
}, false);

function togglePlayPause() {
  if (video.paused || video.ended) {
    video.play();
    maybeShowLoadingIndicator();
  } else {
    video.pause();
  }
  updatePlaypause();
}

function reverseVideo() {
  window.pushEvent('video-reverse', {
    lon: window.state.lon,
    lat: window.state.lat
  })
}

function seekFromProgress(e) {
  const rect = this.getBoundingClientRect();
  const pos = (e.pageX - rect.left) / this.offsetWidth;
  const max = Math.round(video.duration * 1000) || state.videoLengthMs;

  seekToTime(pos * max);
};

function updateProgressbar() {
  const ms = Math.round(video.currentTime * 1000) || state.videoStart;
  const max = Math.round(video.duration * 1000) || state.videoLengthMs;
  const msText = ms2text(ms);
  const maxText = ms2text(max);

  let loaded = 0;
  for (var i = 0; i < video.buffered.length; i++) {
    const start = video.buffered.start(i) * 1000;
    const end = video.buffered.end(i) * 1000;
    if (start > ms) break;
    if (end < ms) continue;

    loaded = end / max * 100;
  }
  window.requestAnimationFrame(() => {
    current.innerText = msText;
    duration.innerText = maxText;
    progress.value = ms;
    progress.max = max;
    progress.style.setProperty("--loaded", loaded + "%");
  });
}

function updatePlaypause() {
  outer.setAttribute('data-state', video.paused || video.ended ? 'play' : 'pause');
}

const minuteInMs = 60 * 1000;
const hourInMs = 60 * minuteInMs;

function pad0(num) {
  return num < 10 ? "0" + num : num;
}

function ms2text(ms) {
  const hours = Math.floor(ms / hourInMs);
  ms -= hours * hourInMs;
  const minutes = Math.floor(ms / minuteInMs);
  ms -= minutes * minuteInMs;
  const seconds = Math.round(ms / 1000);
  ms -= seconds * 1000;
  if (hours > 0) return `${hours}:${pad0(minutes)}:${pad0(seconds)}`;
  return `${minutes}:${pad0(seconds)}`;
}

function isTouch() {
  return "ontouchstart" in window || navigator.maxTouchPoints > 0 || navigator.msMaxTouchPoints > 0;
}

function toggleFullscreen() {
  const fullscreenElement =
    document.fullscreenElement ||
    document.mozFullScreenElement ||
    document.webkitFullscreenElement ||
    document.msFullscreenElement ||
    document.body.classList.contains("fullscreen");
  if (fullscreenElement) {
    exitFullscreen();
  } else {
    launchIntoFullscreen(outer);
  }
}

function launchIntoFullscreen(element) {
  if (element.requestFullscreen) {
    element.requestFullscreen();
  } else if (element.mozRequestFullScreen) {
    element.mozRequestFullScreen();
  } else if (video.webkitSetPresentationMode) {
    video.webkitSetPresentationMode('fullscreen');
  } else if (element.webkitRequestFullscreen && !isTouch()) {
    element.webkitRequestFullscreen();
  } else if (element.msRequestFullscreen) {
    element.msRequestFullscreen();
  } else {
    document.body.classList.add('fullscreen');
  }

  inactivityListener(true);
}

function exitFullscreen() {
  if (document.exitFullscreen) {
    document.exitFullscreen();
  } else if (document.mozCancelFullScreen) {
    document.mozCancelFullScreen();
  } else if (video.webkitSetPresentationMode) {
    video.webkitSetPresentationMode('inline');
  } else if (document.webkitExitFullscreen) {
    document.webkitExitFullscreen();
  } else if (document.msExitFullscreen) {
    document.msExitFullscreen();
  }

  inactivityListener(false);
  document.body.classList.remove('fullscreen');
}

let inactivityTimeout = null;

function inactivityListener(bool) {
  if (bool) {
    outer.addEventListener("mousemove", inactivityDelay);
    outer.addEventListener("touchmove", inactivityDelay);
    inactivityReset();
  } else {
    outer.removeEventListener("mousemove", inactivityDelay);
    outer.removeEventListener("touchmove", inactivityDelay);
    inactivityDelay();
  }
}

function inactivityReset() {
  if (inactivityTimeout) {
    clearTimeout(inactivityTimeout);
    inactivityTimeout = null;
  }
  outer.classList.remove("inactivity");
}

function inactivityDelay() {
  inactivityReset()
  inactivityTimeout = setTimeout(() => {
    // don't hide the controls if the cursor is hovering them
    if (controls.matches(':hover')) return;
    outer.classList.add("inactivity");
  }, 2000);
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
setVideo()
