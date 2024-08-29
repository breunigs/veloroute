import "./rvfc-polyfill"
import Hls from "hls.js/dist/hls.light.min.js"

let prevVideo = null;
let previouslyPlayingCodec = null;
let autoplay = false;

let wasSocketDisconnected = false
window.liveSocket.getSocket().onClose(e => {
  console.debug("socket was closed, ignoring next video seekToStartTime")
  wasSocketDisconnected = true
})

let video
function initVideoElement() {
  if (video === document.getElementById('videoInner')) return

  video = document.getElementById('videoInner');
  video.addEventListener('loadedmetadata', seekToStartTime);
  video.addEventListener('loadedmetadata', updateMetadata);
  video.addEventListener('loadeddata', maybeShowLoadingIndicator);
  video.addEventListener('stalled', maybeShowLoadingIndicator);
  video.addEventListener('waiting', maybeShowLoadingIndicator);
  video.addEventListener('playing', maybeShowLoadingIndicator);
  video.addEventListener('seeked', maybeShowLoadingIndicator);
  video.addEventListener('seeking', maybeShowLoadingIndicator);
  video.addEventListener('timeupdate', updateMetadata);
  video.addEventListener('timeupdate', updateProgressbar);
  video.addEventListener('progress', updateProgressbar);
  video.addEventListener('ended', maybeExecEndAction);
  video.addEventListener('ended', updatePlaypause);
  video.addEventListener('play', markPlay);
  video.addEventListener('play', updatePlaypause);
  video.addEventListener('play', () => timeUpdate());
  video.addEventListener('play', ensureVideoIsSet, {
    once: true
  });
  video.addEventListener('pause', markPause);
  video.addEventListener('pause', updatePlaypause);
  video.addEventListener('pause', maybeShowLoadingIndicator);
}
initVideoElement()
window.addEventListener("global:mounted", initVideoElement)

const posterURL = video.poster.split("/")
let videoMeta = { hash: posterURL.at(-2), start: posterURL.at(-1) }
window.addEventListener("phx:video_meta", e => {
  console.log("updating video meta", e.detail)
  Object.assign(videoMeta, e.detail)
  maybeUpdatePoster(e.detail)
  setVideo(wasSocketDisconnected)
  maybeTimeUpdate(e.detail)

  video.loop = videoMeta.end_action == "loop";
  wasSocketDisconnected = false

  if (preloadedHlsJs) updateVideoElement(true)
});

// allow HLS direct play only on iOS/OSX devices, because I found Android phones
// that claim they can parse m3u8 but then fail without fallback.
const canPlayHLS = /iPad|iPhone|iPod|like Mac OS X|Macintosh/.test(navigator.userAgent)
  && video.canPlayType('application/vnd.apple.mpegurl')

let videoTimeInMs = 0;
let rvfc = null

function timeUpdate(_now, metadata) {
  if (rvfc) video.cancelVideoFrameCallback(rvfc)
  rvfc = video.requestVideoFrameCallback(timeUpdate)

  if (!metadata) return

  // iOS has a bug where the video time is reported as 0.0 during loading
  if (canPlayHLS && video.readyState <= 2 && metadata.mediaTime == 0) {
    return;
  }

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
  updateProgressbar()
}

function maybeExecEndAction() {
  const end = videoMeta.end_action
  console.debug("video ended, action:", end)
  let term = null

  if (end === "reverse") {
    autoplay = true
    reverseVideo()
    term = end
  } else if (typeof end === "object" && end.action) {
    cacheVideoPoster()
    window.pushEvent("video-ended", { action: end.action })
    term = end.action
  }

  if (term) window.plausible('video-end-action', {
    props: {
      action: term
    }
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
  current.setAttribute("phx-update", "ignore")
  videoMetadataEl.setAttribute("phx-update", "ignore")
}

function markPause() {
  window.pushEvent('video-current-time', {
    pos: videoTimeInMs
  })
  current.setAttribute("phx-update", "")
  videoMetadataEl.setAttribute("phx-update", "")
}

function sendCurrentVideoTime(eventName) {
  window.pushEvent(eventName || 'video-current-time', {
    pos: videoTimeInMs
  })
}

let hlsJsTriedMediaRecovery
function attachHlsErrorHandler(hls) {
  hlsJsTriedMediaRecovery = false

  hls.on(Hls.Events.ERROR, function (event, data) {
    let props = {
      type: data.type,
      details: data.details,
      fallback: false,
      triedRecovery: hlsJsTriedMediaRecovery,
    }

    if (hls.url) props.video = window.hls.url.split("/").slice(-2)[0]

    try {
      const details = window.hls.levels[window.hls.currentLevel]
      props.dimension = `${details.width}x${details.height}`
      props.codec = details.codecSet
    } catch {
      props.dimension = 'no-hls-level'
      props.codec = 'no-hls-level'
    }

    const isFatalMediaError = data.fatal && data.type == Hls.ErrorTypes.MEDIA_ERROR
    if (isFatalMediaError && !hlsJsTriedMediaRecovery) {
      hlsJsTriedMediaRecovery = true
      cacheVideoPoster()
      hls.recoverMediaError()
    } else if (isFatalMediaError) {
      cacheVideoPoster()
      console.warn('Hls encountered a fatal error. Destroying it and letting the browser use the fallback.', data);
      sendCurrentVideoTime('video-fatal-hls');
      videoMeta.start = videoTimeInMs;
      autoplay = true
      window.hls.destroy()
      window.hls = false
      updateVideoElement()
      props.fallback = true
    } else {
      console.log('Hls encountered an error', data);
      sendCurrentVideoTime();
    }

    let eventName = 'video-hls-error'
    if (data.fatal) eventName += '-fatal'
    window.plausible(eventName, { props: props });
  });
}

let cacheVideoPosterTimeout = null
let cacheVideoPosterPos = null
function cacheVideoPoster() {
  // for some reason iOS is extremely slow, making the experience worse
  if (canPlayHLS) return

  // do not attempt to cache if the video likely doesn't have a valid image
  if (video.readyState < 4 && !video.ended) return

  const curPos = `${prevVideo} ${video.currentTime}`
  if (cacheVideoPosterPos === curPos) return
  cacheVideoPosterPos = curPos

  clearTimeout(cacheVideoPosterTimeout)

  let canvas = document.createElement('canvas');
  canvas.width = video.videoWidth;
  canvas.height = video.videoHeight;

  let ctx = canvas.getContext('2d');
  ctx.drawImage(video, 0, 0, canvas.width, canvas.height);

  let image = canvas.toDataURL("image/jpeg");
  if (image.length < 100) return console.log("not setting background image, as export seems broken")
  video.setAttribute("poster", image)

  cacheVideoPosterTimeout = setTimeout(() => {
    if (!document.startViewTransition) return cacheVideoPosterReset();
    document.startViewTransition(cacheVideoPosterReset)
  }, 3000)
}

function cacheVideoPosterReset() {
  video.setAttribute("poster", "")
}

window.addEventListener("map:initialLoad", (e) => {
  updateVideoElement(true)
})

let canPlayThroughEvtListener = null
let preloadedHlsJs = null
let preloadedHlsJsPath = null
function updateVideoElement(preloadOnly) {
  if (!videoMeta.hash) return;
  console.debug('trying to play video for: ', videoMeta.hash)
  if (canPlayHLS) {
    if (preloadOnly) return
    console.debug('native hls; hacking around first frame flash')
    if (video.readyState === 0) {
      // only re-use video poster when it's loaded
      outer.style.backgroundImage = `url("${videoMeta.poster}")`
      outer.style.backgroundSize = 'cover'
    }
    video.style.visibility = 'hidden'
    if (canPlayThroughEvtListener) video.removeEventListener(canPlayThroughEvtListener)
    canPlayThroughEvtListener = video.addEventListener('canplaythrough', () => {
      video.style.visibility = 'visible'
      outer.style.backgroundImage = null
      outer.style.backgroundSize = null
    }, { once: true });
  } else if (window.hls === false || typeof Promise === "undefined" || !Hls.isSupported()) {
    window.hls = false
    if (preloadOnly) return
    console.debug('hls.js not supported, using fallback')
  } else {
    console.debug('no native hls, trying to load hls.js')
    console.debug('loading hls video stream');

    const path = document.getElementById("hlsJsUrl").getAttribute("href");

    if (preloadOnly && (window.hls || preloadedHlsJsPath === path)) return
    if (window.hls && window.hls.url === path) {
      video.playbackRate = videoPlaybackRate
      if (autoplay) video.play()
      return
    }

    let options = {
      autoStartLoad: true,
      enableWebVTT: false,
      lowLatencyMode: false,
      capLevelToPlayerSize: true,
      maxBufferLength: 10, // seconds
      maxMaxBufferLength: 20, // seconds
      startPosition: videoMeta.start / 1000.0,
      capLevelOnFPSDrop: true,
      startFragPrefetch: true,
    };

    if (window.hls && window.hls.currentLevel) {
      const bwEstimate = window.hls.bandwidthEstimate;
      if (typeof bwEstimate === "number") {
        options.abrEwmaDefaultEstimate = bwEstimate;
        options.testBandwidth = false;
        options.startLevel = -1;
        console.debug("copying over previously estimated bandwidth", bwEstimate);
      }

      try {
        if (window.hls.autoLevelEnabled) {
          previouslyPlayingCodec = null;
        } else {
          previouslyPlayingCodec = JSON.stringify(window.hls.levels[window.hls.currentLevel].attrs);
        }
      } catch (error) {
        console.warn(error)
      }
    }

    let hls
    if (preloadedHlsJsPath === path) {
      console.log("using HLS.js preload")
      hls = preloadedHlsJs
      preloadedHlsJs = null
      preloadedHlsJsPath = null
    } else {
      if (preloadedHlsJs) {
        console.log("destroying unused HLS.js preload")
        preloadedHlsJs.destroy()
        preloadedHlsJs = null
        preloadedHlsJsPath = null
      }

      console.log("creating HLS.js from scratch")
      hls = new Hls(options);
      attachHlsErrorHandler(hls)
      hls.on(Hls.Events.MANIFEST_PARSED, restorePreviousQuality);
      hls.on(Hls.Events.MANIFEST_PARSED, seekToStartTime);
      hls.on(Hls.Events.MANIFEST_PARSED, updateQualityChooser);
      hls.on(Hls.Events.LEVEL_SWITCHING, updateQualityChooser);
      hls.on(Hls.Events.LEVEL_SWITCHED, updateQualityChooser);
      hls.on(Hls.Events.DESTROYING, hideQualityChooser);
      hls.loadSource(path);
    }

    if (preloadOnly) {
      console.log("saving HLS.js preload")
      preloadedHlsJs = hls
      preloadedHlsJsPath = path
      return
    }

    properVideoIsLoaded = true
    hls.attachMedia(video)

    // clean up previous instance only after attaching the new one, to ensure a smooth(er) transition
    if (window.hls) window.hls.destroy()
    window.hls = hls

    updatePlaypause();
    video.loop = videoMeta.end_action == "loop";
    return
  }

  properVideoIsLoaded = true
  console.debug('loading regular html video')
  video.autoplay = autoplay;
  video.playbackRate = videoPlaybackRate;
  try { video.load(); } catch (e) { }
  if (autoplay && !video.paused) video.play();
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
  if (Math.abs(videoTimeInMs - videoMeta.start) < 100) {
    video.autoplay = autoplay;
    return;
  }
  console.debug("seeking to", videoMeta.start, " from ", videoTimeInMs);
  if (!autoplay) video.pause();
  seekToTime(videoMeta.start);
  video.autoplay = autoplay;
}

function selectVideoQuality(event) {
  if (!window.hls) return hideQualityChooser();

  const level = event.target.dataset.level;
  if (!level) return;
  if (video.paused || video.readyState <= 2) window.hls.currentLevel = level * 1;
  window.hls.nextLevel = level * 1;
  window.hls.loadLevel = level * 1;
  updateQualityChooser();
  window.hls.bufferController.flushBackBuffer();
  window.plausible('videoQualityChanged')
}

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

    let choosers = "";
    for (let i = window.hls.levels.length - 1; i >= 0; i--) {
      let classes = "eye"
      let checked = "false"
      if (current == i) {
        classes += " active";
        checked = "true";
      }
      if (next == i) {
        classes += " next";
        checked = "mixed";
      }
      const mbits = window.hls.levels[i].bitrate / 1024 / 1024;
      const codecSet = window.hls.levels[i].codecSet;
      const codec = codecTranslate[codecSet] || {
        name: codecSet,
        desc: "Unbekannt"
      };
      let name = `${window.hls.levels[i].height}p`;
      const title = `${name} benötigt ca. ${Math.round(mbits)} MBit/s (Codec: ${codec.name}, ${codec.desc})`

      name += ` <small>${codec.name}</small>`
      choosers += `<a data-level="${i}" class="${classes}" title="${title}" role="menuitemradio" aria-checked="${checked}">${name}</a>`
    }
    choosers += `<a data-level="-1" class="${auto ? "active" : ""}" title="Wählt automatisch die bestmögliche Qualität. Was aktuell angezeigt wird, ist durch das Auge markiert.">automatisch</a>`

    videoQuality.style.display = 'block';
    if (videoQualityOptions.innerHTML != choosers) videoQualityOptions.innerHTML = choosers;
  });
}

function hideQualityChooser() {
  videoQuality.style.display = 'none';
}

let fixSeekForWrongVideoDuration = null
function seekToTime(timeInMs) {
  maybeSwitchToPreloadedHlsJs()

  fixSeekForWrongVideoDuration = null
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
  if (video.duration < inSeconds && video.currentTime < inSeconds) {
    fixSeekForWrongVideoDuration = timeInMs
    video.addEventListener('durationchange', () => {
      if (fixSeekForWrongVideoDuration) seekToTime(fixSeekForWrongVideoDuration)
    }, { once: true })
  }
  updateProgressbar();
}

function maybeShowLoadingIndicator(evt) {
  let showSpinner = !video.paused && !video.ended && video.readyState < 3
  showSpinner = showSpinner || (video.seeking && video.readyState < 3) || fixSeekForWrongVideoDuration
  poster.classList.toggle("loading", !!showSpinner)
}

function maybeUpdatePoster(changedMeta) {
  if (typeof changedMeta.poster === "undefined" || !changedMeta.poster) return
  if (video.readyState >= 1) return

  if (video.poster == changedMeta.poster) return
  console.debug("updating poster to", changedMeta.poster)
  video.setAttribute("poster", changedMeta.poster)
}

let properVideoIsLoaded = false;

function ensureVideoIsSet() {
  if (properVideoIsLoaded) return
  properVideoIsLoaded = true
  console.log("video was not set, doing so now");
  autoplay = true
  setVideo();
}

function setVideo(avoidSeek) {
  if (autoplay) properVideoIsLoaded = true;
  if (!properVideoIsLoaded) {
    if (!avoidSeek && (preloadedHlsJs || window.hls)) seekToStartTime()
    return
  }

  progressWrapper.setAttribute("phx-update", "ignore");

  if (prevVideo !== videoMeta.hash) {
    cacheVideoPoster();
    prevVideo = videoMeta.hash;
    updateVideoElement();
    return;
  }

  if (!avoidSeek) seekToStartTime();
  updateProgressbar();
  updatePlaypause();
}

function maybeSwitchToPreloadedHlsJs() {
  const path = document.getElementById("hlsJsUrl").getAttribute("href")
  if (preloadedHlsJsPath !== path) return
  if (window.hls || window.hls === false) return
  if (!preloadedHlsJs) return

  progressWrapper.setAttribute("phx-update", "ignore")
  updateVideoElement()
}

const videoMetadataEl = document.getElementById('videoRecordingDate');

function updateMetadata() {
  if (!videoMeta.recording_dates) return;
  const { recDate, street } = metadataForTime(videoTimeInMs)
  const text = street === "" ? recDate : recDate === "" ? street : `${street}, ${recDate}`
  if (videoMetadataEl.textContent !== text) videoMetadataEl.textContent = text;
}

function metadataForTime(timeInMs) {
  let recDate = ""
  let street = ""

  if (videoMeta.recording_dates) {
    for (let i = 0; i < videoMeta.recording_dates.length; i += 1) {
      if (videoMeta.recording_dates[i].timestamp > timeInMs) break;
      recDate = videoMeta.recording_dates[i].text;
    }
  }

  if (videoMeta.street_names) {
    for (let i = 0; i < videoMeta.street_names.length; i += 1) {
      if (videoMeta.street_names[i].timestamp > timeInMs) break;
      street = videoMeta.street_names[i].text;
    }
  }

  return { recDate: recDate, street: street }
}

const passive = {
  passive: true
}
let progress
let progressWrapper
let current
let duration
let outer
let controls
let poster
let videoOptions
let videoQuality
let videoQualityOptions
let progressPreviewEl
function initControls() {
  // i.e. no re-init needed
  if (progress === document.getElementById("progress")) return

  progress = document.getElementById("progress")
  progressWrapper = document.getElementById("progressWrapper")
  const playpause = document.getElementById("playpause")
  current = document.getElementById("current")
  duration = document.getElementById("max")
  outer = document.getElementById('videoOuter')
  controls = document.getElementById('videoControls')
  poster = document.getElementById('videoPoster')
  videoOptions = document.getElementById("videoOptions")
  videoQuality = document.getElementById("videoQuality");
  videoQualityOptions = document.getElementById("videoQualityOptions");
  progressPreviewEl = document.getElementById("progressPreview")


  document.getElementById('skipBackward5').addEventListener('click', () => { actionIcon("skipBackward5"); seekToTime(videoTimeInMs - 5000) })
  document.getElementById('skipForward5').addEventListener('click', () => { actionIcon("skipForward5"); seekToTime(videoTimeInMs + 5000) })
  document.getElementById("reverse").addEventListener('click', reverseVideo);
  document.getElementById("fullscreen").addEventListener('click', toggleFullscreen);
  progressWrapper.addEventListener('click', seekFromProgress);
  progressWrapper.addEventListener('mousemove', previewProgress, passive);
  progressWrapper.addEventListener('touchmove', previewProgress, passive);
  progressWrapper.addEventListener('touchstart', scrubStart, passive);
  progressWrapper.addEventListener('touchmove', scrubMove, passive);
  progressWrapper.addEventListener('touchend', scrubEnd, passive);
  progressWrapper.addEventListener('touchcancel', scrubCancel, passive);
  playpause.addEventListener('click', togglePlayPause);
  poster.addEventListener('click', togglePlayPause);

  // provide a way to close the options menu by clicking the gear icon again
  videoOptions.addEventListener('touchstart', hideVideoQualityOptions, passive);
  videoQualityOptions.addEventListener('click', selectVideoQuality);
  document.getElementById('playbackRate').addEventListener('click', selectPlaybackRate);
}

initControls()
window.addEventListener("global:mounted", initControls)



function hideVideoQualityOptions() {
  const hide = window.getComputedStyle(videoQualityOptions).visibility == 'visible';
  videoOptions.classList.toggle("hidden", hide)
}


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

let videoPlaybackRate = 1.0;
function selectPlaybackRate(event) {
  const rate = event.target.dataset.rate;
  if (!rate) return;

  video.playbackRate = rate;
  videoPlaybackRate = rate;

  const prev = document.querySelector("#playbackRate a.active");
  if (prev) {
    prev.classList.remove("active");
    prev.setAttribute("aria-checked", "false");
  }
  event.target.classList.add("active");
  event.target.setAttribute("aria-checked", "true");
}

let toggleActionIconAnimation = null;
function actionIcon(customIcon) {
  cancelAnimationFrame(toggleActionIconAnimation);
  outer.classList.remove("show", "animate", "skipBackward5", "skipForward5", "reverse");
  toggleActionIconAnimation = requestAnimationFrame(() => {
    outer.classList.add("show", customIcon)
    toggleActionIconAnimation = requestAnimationFrame(() => outer.classList.add("animate"))
  })
}

function togglePlayPause(e) {
  if (e.target === video || e.target === poster) {
    actionIcon()
  }

  if (!properVideoIsLoaded) {
    ensureVideoIsSet();
  } else if (video.paused || video.ended) {
    video.play();
    maybeShowLoadingIndicator();
  } else {
    video.pause();
  }
  updatePlaypause();
}

function reverseVideo() {
  actionIcon("reverse")
  cacheVideoPoster()
  window.pushEvent('video-reverse', {
    pos: Math.round(videoTimeInMs)
  })
}

function timeFromProgressPosition(e) {
  const max = videoMeta.length_ms || Math.round(video.duration * 1000)
  const rect = e.target.getBoundingClientRect()
  const pageX = e.pageX || e.changedTouches[0].pageX
  let pos = (pageX - rect.left) / e.target.offsetWidth
  // make snapping to start easier
  if (pos < 0.01) pos = 0
  const time = Math.max(0, Math.min(max, pos * max))
  return [scrubTimeInMs || time, pos]
}

function seekFromProgress(e) {
  const [time, _pos] = timeFromProgressPosition(e)
  seekToTime(time);
};

let progressPreviewRAF = null
function previewProgress(e) {
  if (progressPreviewRAF !== null) return

  progressPreviewRAF = requestAnimationFrame(() => {
    const [time, pos] = timeFromProgressPosition(e)
    const { recDate, street } = metadataForTime(time)
    let text = '';
    if (street !== "") text += `${street}<br>`
    if (recDate !== "") text += `${recDate}<br>`
    if (!isNaN(time)) text += `<b>${ms2text(time)}</b>`
    progressPreviewEl.innerHTML = text
    progressPreviewEl.style.left = (pos * 100) + '%'
    progressPreviewRAF = null
  })
}

let scrubStartTimeMs = null;
let scrubTimeInMs = null;
let scrubStartPos = null;
let scrubVideoMax = null;
let scrubSpaceRight = null;
let scrubRAF = null;
function scrubStart(e) {
  scrubStartPos = e.touches[0].screenX;
  scrubSpaceRight = window.screen.width - e.touches[0].screenX;
  scrubStartTimeMs = fixSeekForWrongVideoDuration || videoTimeInMs;
  scrubVideoMax = videoMeta.length_ms || Math.round(video.duration * 1000);
  progressPreviewEl.classList.add("enabled")
}

function scrubMove(e) {
  const diff = e.touches[0].screenX - scrubStartPos
  // scale by space available to finger. Most likely, it's towards the left of
  // the screen, hence going backwards will scrub much faster than forward.
  const normalized = diff / (diff > 0 ? scrubSpaceRight : scrubStartPos)
  // the scaling factors are guessed. Considering video time still allows fast
  // scrubbing for long videos.
  const newTime = scrubStartTimeMs + normalized * 100000 * scrubVideoMax / 100000
  scrubTimeInMs = Math.min(scrubVideoMax, Math.max(0, newTime));
  if (scrubRAF !== null) return
  scrubRAF = window.requestAnimationFrame(() => {
    scrubRAF = null
    if (scrubTimeInMs === null || isNaN(scrubTimeInMs)) return
    updateProgressbar()
  })
}

function scrubEnd(e) {
  progressPreviewEl.classList.remove("enabled")
  if (scrubTimeInMs === null || isNaN(scrubTimeInMs)) return
  seekToTime(scrubTimeInMs)
  scrubTimeInMs = null

}

function scrubCancel(e) {
  progressPreviewEl.classList.remove("enabled")
  if (scrubStartTimeMs === null || isNaN(scrubStartTimeMs)) return
  seekToTime(scrubStartTimeMs)
  scrubTimeInMs = null
}

function updateProgressbar() {
  const ms = scrubTimeInMs !== null
    ? scrubTimeInMs
    : (fixSeekForWrongVideoDuration || videoTimeInMs);
  const max = videoMeta.length_ms || Math.round(video.duration * 1000);
  if (isNaN(ms) || isNaN(max)) return
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
    if (current.textContent !== msText) current.textContent = msText;
    if (duration.textContent !== maxText) duration.textContent = maxText;
    progress.value = ms;
    progressWrapper.setAttribute("aria-valuenow", ms)
    if (progress.max !== max) progress.max = max;
    progress.style.setProperty("--loaded", loaded + "%");
  });
}

function updatePlaypause() {
  outer.setAttribute('data-state', !autoplay && (video.paused || video.ended) ? 'play' : 'pause');
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

// keep in sync with video/constants.ex
const videoFPS = 30000 / 1001
let frameSeeked = false
document.addEventListener("keyup", (e) => {
  if (e.ctrlKey || e.shiftKey || e.altKey) return
  if (!e.target || e.target.tagName == "INPUT") return
  if (e.key != "." && e.key != ",") return

  if (!frameSeeked) {
    frameSeeked = true
    properVideoIsLoaded = true
    setVideo();
  }

  if (e.key == "." && video.currentTime < video.duration) {
    console.log("seek+")
    seekToTime(videoTimeInMs + 1 / videoFPS * 1000)
  }
  if (e.key == "," && video.currentTime > 0) {
    console.log("seek-")
    seekToTime(videoTimeInMs - 1 / videoFPS * 1000)
  }
})
