// import * as Hls from 'hls.js';

function attachHlsErrorHandler(obj, Hls) {
  obj.on(Hls.Events.ERROR, function (event, data) {
    if (data.fatal) {
      switch (data.type) {
        case Hls.ErrorTypes.NETWORK_ERROR:
          console.warn('fatal network error encountered, try to recover');
          obj.startLoad();
          break;
        case Hls.ErrorTypes.MEDIA_ERROR:
          console.warn('fatal media error encountered, try to recover');
          obj.recoverMediaError();
          break;
        default:
          console.warn('failed to recover HLS', data);
          // obj.destroy();
          break;
      }
    }
  });
}

function updateVideoElement(videoHash) {
  console.debug('trying to play video for: ', videoHash)
  const stream = `/videos-rendered/${videoHash}/stream.m3u8`;
  const fallback = `/videos-rendered/${videoHash}/fallback.mp4`;

  if (video.canPlayType('application/vnd.apple.mpegurl')) {
    console.debug('native hls, doing nothing?')
  } else if (window.hls) {
    console.debug('reusing hls.js')
    window.hls.loadSource(stream);
  } else if (window.hls === false) {
    console.debug('hls.js not supported, using fallback')
  } else {
    console.debug('no native hls, trying to load hls.js')
    import('hls.js').then(Hls => {
      if (!Hls.isSupported()) return window.hls = false;
      console.debug('streamed hls');
      Hls = Hls.default;

      window.hls = new Hls({
        startFragPrefetch: true,
        enableWebVTT: false,
      });
      hls.attachMedia(video);
      hls.on(Hls.Events.MANIFEST_PARSED, seekToStartTime);
      attachHlsErrorHandler(hls, Hls);
      updateVideoElement(videoHash)
    })
    return
  }

  video.innerHTML = `
    <source src="${stream}#t=${state.videoStart / 1000.0}" type="application/x-mpegURL">
    <source src="${fallback}#t=${state.videoStart / 1000.0}" type="video/mp4">
  `;
}

function seekToStartTime() {
  if (prevStartTimeMs == state.videoStart) return;
  seekToTime(state.videoStart);
  prevStartTimeMs = state.videoStart;
}

function seekToTime(timeInMs) {
  if (video === null) return;
  const seconds = timeInMs / 1000.0;
  if (video.currentTime == seconds) return;
  video.currentTime = seconds;
}

function playVideo() {
  if (prevVideo !== state.video) {
    prevVideo = state.video;
    updateVideoElement(state.video);
    return;
  }

  if (prevStartTimeMs != state.videoStart) {
    seekToStartTime();
    video.pause();
  }
}

function removeVideo() {
  prevVideo = null;
  video.pause();
  video.innerHTML = '';
}

function setVideo() {
  if (state.video) {
    playVideo()
  } else {
    removeVideo()
  }
}

const video = document.getElementById('videoInner');
let prevVideo = null;
let prevStartTimeMs = 0;
video.addEventListener('loadedmetadata', seekToStartTime);


window.videoStateChanged = setVideo;
setVideo()
