import "./rvfc-polyfill"

let prevVideo = null;
let prevStartGen = null;
let previouslyPlayingCodec = null;
let autoplay = false;

let videoMeta = {}
window.addEventListener("phx:video_meta", e => {
  console.log("updating video meta", e.detail)
  Object.assign(videoMeta, e.detail)
  maybeUpdatePoster(e.detail)
  maybeTimeUpdate(e.detail)
  setVideo()
});

const video = document.getElementById('videoInner');
video.addEventListener('loadedmetadata', seekToStartTime);
video.addEventListener('loadedmetadata', updateMetadata);
video.addEventListener('loadeddata', maybeShowLoadingIndicator);
video.addEventListener('stalled', maybeShowLoadingIndicator);
video.addEventListener('waiting', maybeShowLoadingIndicator);
video.addEventListener('playing', maybeShowLoadingIndicator);
video.addEventListener('timeupdate', updateMetadata);
video.addEventListener('timeupdate', updateProgressbar);
video.addEventListener('progress', updateProgressbar);
video.addEventListener('play', markPlay);
video.addEventListener('play', updatePlaypause);
video.addEventListener('play', () => timeUpdate());
video.addEventListener('play', ensureVideoIsSet, {
  once: true
});
video.addEventListener('pause', markPause);
video.addEventListener('pause', updatePlaypause);

// 3 MBit/s, i.e. not 240p. Halfed on every buffer stall.
let minAutoBitrate = 3 * 1000 * 1000;

const canPlayHLS = video.canPlayType('application/vnd.apple.mpegurl')

let videoTimeInMs = 0;
let rvfc = null

function timeUpdate(_now, metadata) {
  if (rvfc) video.cancelVideoFrameCallback(rvfc)
  rvfc = video.requestVideoFrameCallback(timeUpdate)

  if (!metadata) return
  videoTimeInMs = Math.round(metadata.mediaTime * 1000)
  window.dispatchEvent(new CustomEvent("video:timeupdate", {
    detail: {
      timeInMs: videoTimeInMs
    }
  }));
}

function maybeTimeUpdate(changedMeta) {
  if (typeof changedMeta.start === "undefined") return
  timeUpdate(null, {
    mediaTime: changedMeta.start / 1000
  })
}

window.addEventListener(`phx:video:autoplay`, (e) => {
  console.debug("enabling autoplay", e.detail)
  autoplay = true
  setVideo();
})

function markPlay() {
  window.plausible('video-play', {
    props: {
      hash: videoMeta.hash
    }
  })
  autoplay = false
}

function markPause() {
  window.pushEvent('video-current-time', {
    pos: videoTimeInMs
  })
}

function sendCurrentVideoTime(eventName) {
  window.pushEvent(eventName || 'video-current-time', {
    pos: videoTimeInMs
  })
}

function attachHlsErrorHandler(obj, Hls) {
  obj.on(Hls.Events.ERROR, function (event, data) {
    let props = {
      type: data.type,
      details: data.details,
    }

    try {
      const details = window.hls.levels[window.hls.currentLevel];
      props.bitrate = `${details.bitrate}`;
      props.dimension = `${details.width}x${details.height}`;
      props.codec = details.codecSet;
    } catch (error) {
      props.error = "HLS has no current level"
    }

    if (data.fatal || data.type === Hls.ErrorTypes.MEDIA_ERROR && data.details === "bufferAppendError") {
      console.warn('Hls encountered a fatal error. Destroying it and letting the browser use one of the fallbacks.', data);
      sendCurrentVideoTime('video-fatal-hls');
      window.videoMeta.start = videoTimeInMs;
      autoplay = true
      window.hls = false;
      obj.destroy();
      updateVideoElement();
      window.plausible('video-hls-error-fatal', {
        props: props
      });
    } else {
      if (data.type === Hls.ErrorTypes.MEDIA_ERROR && data.details === "bufferStalledError") {
        minAutoBitrate = Math.round(minAutoBitrate / 2)
        window.hls.config.minAutoBitrate = minAutoBitrate
        console.log("halfed minAutoBitrate to", minAutoBitrate)
      }
      console.log('Hls encountered an error', data);
      sendCurrentVideoTime();
      window.plausible('video-hls-error', {
        props: props
      });
    }
  });
}

function updateVideoElement() {
  if (!videoMeta.hash) return;
  console.debug('trying to play video for: ', videoMeta.hash)
  const path = `/videos-rendered/${videoMeta.hash}/`;
  const preloads = `
    <link rel="preload" as="fetch" crossorigin="anonymous" href="${path}stream.m3u8">
    <link rel="preload" as="fetch" crossorigin="anonymous" href="${path}stream_0.m3u8">
  `;

  if (canPlayHLS) {
    console.debug('native hls, doing nothing?')
  } else if (window.hls === false || typeof Promise === "undefined") {
    console.debug('hls.js not supported, using fallback')
  } else {
    console.debug('no native hls, trying to load hls.js')
    video.innerHTML = preloads;
    import('hls.js/dist/hls.light.js').then(Hls => {
      if (!Hls.isSupported()) return window.hls = false;
      console.debug('loading hls video stream');
      Hls = Hls.default;

      let options = {
        autoStartLoad: true,
        enableWebVTT: false,
        lowLatencyMode: false,
        maxBufferLength: 10, // seconds
        maxMaxBufferLength: 20, // seconds
        minAutoBitrate: minAutoBitrate,
        startPosition: videoMeta.start / 1000.0,
      };

      if (window.hls && window.hls.currentLevel) {
        const bwEstimate = window.hls.bandwidthEstimate;
        if (typeof bwEstimate === "number") {
          options.abrEwmaDefaultEstimate = bwEstimate;
          options.testBandwidth = false;
          options.startLevel = -1;
          console.debug("copying over previously eastimated bandwidth", bwEstimate);
        }

        try {
          previouslyPlayingCodec = JSON.stringify(window.hls.levels[window.hls.currentLevel].attrs);
        } catch (error) {
          console.warn(error)
        }

        // don't leak previous instance
        window.hls.destroy();
      }

      window.hls = new Hls(options);
      window.hls.attachMedia(video);
      attachHlsErrorHandler(hls, Hls);
      window.hls.on(Hls.Events.MANIFEST_PARSED, restorePreviousQuality);
      window.hls.on(Hls.Events.MANIFEST_PARSED, seekToStartTime);
      window.hls.on(Hls.Events.MANIFEST_PARSED, updateQualityChooser);
      window.hls.on(Hls.Events.LEVEL_SWITCHING, updateQualityChooser);
      window.hls.on(Hls.Events.LEVEL_SWITCHED, updateQualityChooser);
      window.hls.on(Hls.Events.DESTROYING, hideQualityChooser);
      window.hls.loadSource(`${path}stream.m3u8`);
      updatePlaypause();
      video.addEventListener('play', () => {
        if (!window.hls) return;
        console.debug("triggering hls.startLoad");
        window.hls.startLoad(-1);
      });
    })
    return
  }

  console.debug('loading regular html video')
  const time = `#t=${videoMeta.start / 1000.0}`;
  // codec version for h264 can be determined through (Debian package: gpac)
  // MP4Box -info fallback.mp4 2>&1 | grep RFC6381 | awk '{print $4}'
  const innerHTML = `
    <source src="${path}stream.m3u8${time}" type="application/x-mpegURL">
    <source src="${path}fallback.webm${time}" type="video/webm; codecs=av1">
    <source src="${path}fallback.mp4${time}" type="video/mp4; codecs=avc1.64001E">
    <p>Abspielen im Browser klappt wohl nicht. Du kannst das <a href="${path}fallback.mp4" target="_blank">Video herunterladen</a> und anderweitig anschauen.</p>
    ${preloads}
  `;
  video.innerHTML = innerHTML;
  video.autoplay = autoplay;
  video.load();
  if (autoplay) video.play();
}

function restorePreviousQuality() {
  if (!previouslyPlayingCodec) return;
  for (let i = 0; i < window.hls.levels.length; i++) {
    if (JSON.stringify(window.hls.levels[i].attrs) == previouslyPlayingCodec) {
      window.hls.currentLevel = i;
      console.debug("restoring previously used quality")
      break
    }
  }
}

function seekToStartTime() {
  if (Math.abs(videoTimeInMs - videoMeta.start) < 100 || prevStartGen == videoMeta.start_gen) {
    video.autoplay = autoplay;
    return;
  }
  console.debug("seeking to", videoMeta.start, "(from ", videoTimeInMs,
    ", gen", prevStartGen, "→", videoMeta.start_gen, ")");
  if (!autoplay) video.pause();
  seekToTime(videoMeta.start);
  video.autoplay = autoplay;
  prevStartGen = videoMeta.start_gen;
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
  window.hls.bufferController.flushBackBuffer();
  window.plausible('videoQualityChanged')
});

const codecTranslate = {
  avc1: {
    name: "H.264",
    desc: "mäßige Qualität, funktioniert praktisch überall"
  },
  vp09: {
    name: "VP9",
    desc: "mittlere Qualität, auf Handys problematisch"
  },
  hc1: {
    name: "HEVC",
    desc: "gute Qualität, nur auf Apple Geräten"
  },
  av01: {
    name: "AV1",
    desc: "gute Qualität, auf Handys problematisch"
  },
}

function updateQualityChooser() {
  if (!window.hls) return hideQualityChooser();

  requestAnimationFrame(() => {
    const current = window.hls.currentLevel;
    const next = window.hls.loadLevel;
    const auto = window.hls.autoLevelEnabled;

    let duplicates = {};
    let displayCodec = false;
    for (let i = 0; i < window.hls.levels.length; i++) {
      const h = window.hls.levels[i].height;
      if (duplicates[h]) {
        displayCodec = true;
        break
      }
      duplicates[h] = true;
    }

    let choosers = "";
    for (let i = window.hls.levels.length - 1; i >= 0; i--) {
      let classes = "eye"
      if (current == i) classes += " active";
      if (next == i) classes += " next";
      const mbits = window.hls.levels[i].bitrate / 1024 / 1024;
      const codecSet = window.hls.levels[i].codecSet;
      const codec = codecTranslate[codecSet] || {
        name: codecSet,
        desc: "Unbekannt"
      };
      let name = `${window.hls.levels[i].height}p`;
      const title = `${name} benötigt ca. ${Math.round(mbits)} MBit/s (Codec: ${codec.name}, ${codec.desc})`

      if (displayCodec) name += ` <small>${codec.name}</small>`
      choosers += `<a data-level="${i}" class="${classes}" title="${title}">${name}</a>`
    }
    choosers += `<a data-level="-1" class="${auto ? "active" : ""}" title="Wählt automatisch die bestmögliche Qualität. Was aktuell angezeigt wird, ist durch das Auge markiert.">automatisch</a>`

    videoQuality.style.display = 'block';
    if (videoQualityOptions.innerHTML != choosers) videoQualityOptions.innerHTML = choosers;
  });
}

function hideQualityChooser() {
  videoQuality.style.display = 'none';
}

function seekToTime(timeInMs) {
  timeInMs = Math.max(timeInMs, 0);
  const inSeconds = timeInMs / 1000.0;

  if (video.currentTime == inSeconds) return;
  video.currentTime = inSeconds;
  // without this check there's a continous loop on iOS
  if (videoMeta.start * 1 != timeInMs) {
    window.pushEvent('video-current-time', {
      pos: Math.round(timeInMs),
    })
  }
  updateProgressbar();
}

function maybeShowLoadingIndicator(evt) {
  const showSpinner = !video.paused && !video.ended && video.readyState < 3
  poster.classList.toggle("loading", showSpinner)
}

function maybeUpdatePoster(changedMeta) {
  if (typeof changedMeta.poster === "undefined") return

  const url = (video.readyState >= 1 || !changedMeta.poster) ? "" : changedMeta.poster
  console.debug("updating poster to", url)
  video.setAttribute("poster", url)
}

let userClickPlayOnce = false;

function ensureVideoIsSet() {
  if (userClickPlayOnce) return
  userClickPlayOnce = true
  console.log("video was not set, doing so now");
  autoplay = true
  setVideo();
}

function setVideo() {
  if (autoplay) userClickPlayOnce = true;
  if (!userClickPlayOnce) return;

  if (prevVideo !== videoMeta.hash) {
    prevVideo = videoMeta.hash;
    updateVideoElement();
    return;
  }

  seekToStartTime();
  updateProgressbar();
  updatePlaypause();
}

const videoRecordingDateEl = document.getElementById('videoRecordingDate');

function updateMetadata() {
  if (!videoMeta.recording_dates) return;

  let text = "";
  for (let i = 0; i < videoMeta.recording_dates.length; i += 1) {
    if (videoMeta.recording_dates[i].timestamp > videoTimeInMs) break;
    text = videoMeta.recording_dates[i].text;
  }
  if (videoRecordingDateEl.textContent !== text) videoRecordingDateEl.textContent = text;
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
document.getElementById('skipBackward5').addEventListener('click', () => seekToTime(videoTimeInMs - 5000))
document.getElementById('skipForward5').addEventListener('click', () => seekToTime(videoTimeInMs + 5000))
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
    // work around iOS bug where switching tabs hangs HLS video play completely?
    if (canPlayHLS) updateVideoElement();

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
    pos: Math.round(videoTimeInMs)
  })
}

function seekFromProgress(e) {
  const rect = this.getBoundingClientRect();
  const pos = (e.pageX - rect.left) / this.offsetWidth;
  const max = Math.round(video.duration * 1000) || videoMeta.length_ms;

  seekToTime(pos * max);
};

function updateProgressbar() {
  const ms = videoTimeInMs;
  const max = Math.round(video.duration * 1000) || videoMeta.length_ms;
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
  const seconds = Math.floor(ms / 1000);
  if (hours > 0) return `${hours}:${pad0(minutes)}:${pad0(seconds)}`;
  return `${minutes}:${pad0(seconds)}`;
}

function isTouch() {
  return "ontouchstart" in window || navigator.maxTouchPoints > 0 || navigator.msMaxTouchPoints > 0;
}

function toggleFullscreen() {
  const fullscreenElement =
    document.fullscreenElement ||
    document.webkitFullscreenElement ||
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
  } else if (video.webkitSetPresentationMode) {
    video.webkitSetPresentationMode('fullscreen');
  } else if (element.webkitRequestFullscreen && !isTouch()) {
    element.webkitRequestFullscreen();
  } else {
    document.body.classList.add('fullscreen');
  }

  inactivityListener(true);
}

function exitFullscreen() {
  if (document.exitFullscreen) {
    document.exitFullscreen();
  } else if (video.webkitSetPresentationMode) {
    video.webkitSetPresentationMode('inline');
  } else if (document.webkitExitFullscreen) {
    document.webkitExitFullscreen();
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
