import "./rvfc-polyfill"
import Hls from "../vendor/hls.light-iframes.min.js"
import { initQualityChooser } from "./video_quality_chooser"
import { initThumbnailPreview } from "./video_thumbnail"
import { initProgressBar } from "./video_progress_bar"
import { initFullscreen } from "./video_fullscreen"

const once = { once: true }

let prevVideo = null;
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
  video.addEventListener('ended', maybeExecEndAction);
  video.addEventListener('ended', updatePlaypause);
  video.addEventListener('play', markPlay);
  video.addEventListener('play', updatePlaypause);
  video.addEventListener('play', () => timeUpdate());
  video.addEventListener('play', ensureVideoIsSet, once);
  video.addEventListener('pause', markPause);
  video.addEventListener('pause', updatePlaypause);
  video.addEventListener('pause', maybeShowLoadingIndicator);
  video.addEventListener('ratechange', rateChange);
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
const probablySafari = /iPad|iPhone|iPod|like Mac OS X|Macintosh/.test(navigator.userAgent)
const canPlayHLS = probablySafari && video.canPlayType('application/vnd.apple.mpegurl')

let videoTimeInMs = 0;
let rvfc = null

function timeUpdate(now, metadata) {
  if (rvfc) video.cancelVideoFrameCallback(rvfc)
  rvfc = video.requestVideoFrameCallback(timeUpdate)

  if (!metadata) return

  // iOS has a bug where the video time is reported as 0.0 during loading
  if (canPlayHLS && metadata.mediaTime == 0 &&
    (video.readyState <= 2 || video.duration <= 0 || metadata.presentedFrames === 1)
  ) return

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
  progressBar?.update()
}

function maybeExecEndAction() {
  const end = videoMeta.end_action
  console.debug("video ended, action:", end)
  let term = null

  if (end === "reverse") {
    autoplay = true
    reverseVideo()
    term = end
  } else if (typeof end === "object" && end && end.action) {
    queueMicrotask(cacheVideoPoster)
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

function rateChange() {
  if (video.playbackRate == videoPlaybackRate) return
  const option = document.querySelector(`#playbackRate [data-rate^='${video.playbackRate}']`)
  selectPlaybackRate({ target: option })
}

function markPlay() {
  window.plausible('video-play', {
    props: {
      hash: videoMeta.hash
    }
  })
  autoplay = false
  progressBar?.currentEl.setAttribute("phx-update", "ignore")
  videoMetadataEl.setAttribute("phx-update", "ignore")
}

function markPause() {
  sendCurrentVideoTime(null, "markPause")
  progressBar?.currentEl.setAttribute("phx-update", "")
  videoMetadataEl.setAttribute("phx-update", "")
}

function sendCurrentVideoTime(eventName, from) {
  window.pushEvent(eventName || 'video-current-time', {
    pos: videoTimeInMs,
    from: from || "unknown"
  })
}

let hlsJsTriedMediaRecovery
function attachHlsErrorHandler(hls) {
  hlsJsTriedMediaRecovery = false

  hls.on(Hls.Events.ERROR, function (event, data) {
    let props = {
      type: data.type,
      details: data.details,
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
    let eventName = 'video-hls-error'
    if (data.fatal) eventName += '-fatal'

    if (isFatalMediaError && !hlsJsTriedMediaRecovery) {
      hlsJsTriedMediaRecovery = true
      cacheVideoPoster()
      hls.recoverMediaError()
    } else if (isFatalMediaError) {
      cacheVideoPoster()
      console.warn('Hls encountered a fatal error. Destroying it and letting the browser use the fallback.', data);
      sendCurrentVideoTime(eventName);
      videoMeta.start = videoTimeInMs;
      autoplay = true
      window.hls.destroy()
      window.hls = false
      updateVideoElement()
    } else {
      console.log('Hls encountered an error', data);
      sendCurrentVideoTime(eventName, `${data.type} ${data.details}`);
    }

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

  setTimeout(() => {
    let image = canvas.toDataURL("image/jpeg");
    if (image.length < 100) return console.log("not setting background image, as export seems broken")
    video.setAttribute("poster", image)

    cacheVideoPosterTimeout = setTimeout(() => {
      if (!document.startViewTransition || !video.paused) return cacheVideoPosterReset();
      document.startViewTransition(cacheVideoPosterReset)
    }, 3000)
  }, 0)
}

function cacheVideoPosterReset() {
  video.setAttribute("poster", "")
}

window.addEventListener("map:initialLoad", (e) => {
  updateVideoElement(true)
})

let preloadedHlsJs = null
let preloadedHlsJsPath = null
function updateVideoElement(preloadOnly) {
  if (!videoMeta.hash) return;
  console.debug('trying to play video for: ', videoMeta.hash)
  if (canPlayHLS) {
    if (preloadOnly) return
    if (videoMeta.start > 0) preventHLSFirstFrameFlash()
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
      if (autoplay) safePlay()
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

      qualityChooser?.teardown();
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
      hls.on(Hls.Events.MANIFEST_PARSED, seekToStartTime);
      thumbnailPreview?.setup(hls);
      qualityChooser?.setup(hls)
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
  try { video.load(); } catch (e) { console.debug('video loading error', e) }
  if (autoplay) safePlay()
}

let canPlayThroughFallback = null
function preventHLSFirstFrameFlash() {
  console.debug('native hls; hacking around first frame flash')

  if (video.readyState === 0) {
    // only re-use video poster when it's loaded
    outer.style.backgroundImage = `url("${videoMeta.poster}")`
    outer.style.backgroundSize = 'cover'
  }
  video.style.visibility = 'hidden'
  const reset = () => {
    video.style.visibility = 'visible'
    outer.style.backgroundImage = null
    outer.style.backgroundSize = null

    video.removeEventListener(eventType, reset)
    clearTimeout(canPlayThroughFallback)
  }

  const eventType = videoMeta.start == 0 ? 'playing' : 'seeked'
  video.addEventListener(eventType, reset, { once: true });
  if (canPlayThroughFallback) clearTimeout(canPlayThroughFallback)
  canPlayThroughFallback = setTimeout(reset, 1000);
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
      from: "iOS workaround"
    })
  }
  videoMeta.start = timeInMs;

  if (video.duration < inSeconds && video.currentTime < inSeconds) {
    fixSeekForWrongVideoDuration = timeInMs
    video.addEventListener('durationchange', () => {
      if (fixSeekForWrongVideoDuration) seekToTime(fixSeekForWrongVideoDuration)
    }, { once: true })
  }

  progressBar?.update(timeInMs);
}

let prevShowSpinner = false
function maybeShowLoadingIndicator(evt) {
  let showSpinner = !video.paused && !video.ended && video.readyState < 3
  showSpinner = showSpinner || (video.seeking && video.readyState < 3) || fixSeekForWrongVideoDuration
  if (prevShowSpinner !== !!showSpinner) poster.classList.toggle("loading", !!showSpinner)
  prevShowSpinner = !!showSpinner
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

  progressBar?.progressWrapper.setAttribute("phx-update", "ignore");

  if (prevVideo !== videoMeta.hash) {
    cacheVideoPoster();
    prevVideo = videoMeta.hash;
    updateVideoElement();
    return;
  }

  if (!avoidSeek) seekToStartTime();
  progressBar?.update(videoTimeInMs);
  updatePlaypause();
}

function maybeSwitchToPreloadedHlsJs() {
  const path = document.getElementById("hlsJsUrl").getAttribute("href")
  if (preloadedHlsJsPath !== path) return
  if (window.hls || window.hls === false) return
  if (!preloadedHlsJs) return

  progressBar?.progressWrapper.setAttribute("phx-update", "ignore")
  updateVideoElement()
}

const videoMetadataEl = document.getElementById('videoRecordingDate');

function updateMetadata() {
  if (!videoMeta.recording_dates) return;
  const { recDate, street } = metadataForTime(videoTimeInMs)
  const text = street === "" ? recDate : recDate === "" ? street : `${street}, ${recDate}`
  if (videoMetadataEl.textContent !== text) {
    videoMetadataEl.textContent = text;
    videoMetadataEl.setAttribute("title", text);
  }
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

const qualityChooserIDs = {
  videoQualityID: "videoQuality",
  videoQualityOptionsID: "videoQualityOptions",
  videoOptionsID: "videoOptions",
  videoID: "videoInner"
}

let outer
let controls
let poster
let thumbnailPreview
let qualityChooser
let progressBar
let fullscreen
function initControls() {
  // i.e. no re-init needed
  if (outer === document.getElementById('videoOuter')) return

  const playpause = document.getElementById("playpause")
  outer = document.getElementById('videoOuter')
  controls = document.getElementById('videoControls')
  poster = document.getElementById('videoPoster')
  thumbnailPreview = initThumbnailPreview("thumbnailPreview", "progressPreview")
  qualityChooser = initQualityChooser(qualityChooserIDs)
  progressBar = initProgressBar("progressWrapper", "videoInner", seekToTime, {
    thumbnailPreview,
    getMetaText: metadataForTime,
    getVideoTimeMs: () => fixSeekForWrongVideoDuration || videoTimeInMs,
    getDuration: () => videoMeta.length_ms || Math.round(video.duration * 1000),
  })
  fullscreen = initFullscreen("videoOuter", "videoControls", "videoInner")

  document.getElementById('skipBackward5').addEventListener('click', () => { actionIcon("skipBackward5"); seekToTime(videoTimeInMs - 5000) })
  document.getElementById('skipForward5').addEventListener('click', () => { actionIcon("skipForward5"); seekToTime(videoTimeInMs + 5000) })
  document.getElementById("reverse").addEventListener('click', reverseVideo);
  document.getElementById("fullscreen").addEventListener('click', fullscreen.toggle);
  playpause.addEventListener('click', togglePlayPause);
  poster.addEventListener('click', togglePlayPause);

  document.getElementById('playbackRate').addEventListener('click', selectPlaybackRate);
}

initControls()
window.addEventListener("global:mounted", initControls)

let wasPlaying = false;
document.addEventListener("visibilitychange", () => {
  if (document["hidden"]) {
    wasPlaying = !video.paused;
    video.pause();
  } else {
    // work around iOS bug where switching tabs hangs HLS video play completely?
    if (canPlayHLS) updateVideoElement();

    if (wasPlaying) safePlay();
  }
}, false);

let videoPlaybackRate = 1.0;
function selectPlaybackRate(event) {
  const rate = event.target?.dataset.rate;
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

function safePlay() {
  const promise = video.play()
  if (promise) promise.catch((e) => {
    console.debug('play() interrupted:', e.name)
    updatePlaypause()
    maybeShowLoadingIndicator()
  })
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

let togglePlayPauseTimeout = null;
function togglePlayPause(e) {
  if (togglePlayPauseTimeout) return;
  togglePlayPauseTimeout = setTimeout(() => { togglePlayPauseTimeout = null }, 100);

  if (e.target === video || e.target === poster) {
    actionIcon()
  }

  if (!properVideoIsLoaded) {
    ensureVideoIsSet();
  } else if (video.paused || video.ended) {
    safePlay();
    maybeShowLoadingIndicator();
  } else {
    video.pause();
  }
  updatePlaypause();
}

function reverseVideo() {
  actionIcon("reverse")
  queueMicrotask(cacheVideoPoster)
  window.pushEvent('video-reverse', {
    pos: Math.round(videoTimeInMs)
  })
}

function updatePlaypause() {
  outer.setAttribute('data-state', !autoplay && (video.paused || video.ended) ? 'play' : 'pause');
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
