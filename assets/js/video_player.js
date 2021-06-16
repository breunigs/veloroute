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
          obj.destroy();
          break;
      }
    }
  });
}

function updateVideoElement(videoHash) {
  console.debug('trying to play video for: ', videoHash)
  video = document.getElementById('videoInner');
  video.addEventListener('loadedmetadata', seekToStartTime);
  video.addEventListener('timeupdate', updateIndicatorPos);

  const stream = `/videos-rendered/${videoHash}/stream.m3u8`;
  const fallback = `/videos-rendered/${videoHash}/fallback.mp4`;

  if (video.canPlayType('application/vnd.apple.mpegurl')) {
    console.debug('native hls, doing nothing?')
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
      window.hls.attachMedia(video);
      attachHlsErrorHandler(hls, Hls);
      window.hls.on(Hls.Events.MANIFEST_PARSED, seekToStartTime);
      window.hls.loadSource(stream);
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
  if (prevVideo !== state.videoHash) {
    prevVideo = state.videoHash;
    updateVideoElement(state.videoHash);
    videoCoords = parseCoordsFromState();
    return;
  }

  if (prevStartTimeMs != state.videoStart) {
    seekToStartTime();
    video.pause();
  }
}

function removeVideo() {
  prevVideo = null;
  videoCoords = null;
  if(video) {
    video.pause();
    video.innerHTML = '';
  }
  if (window.hls) {
    window.hls.destroy()
    window.hls = null;
  }
}

function parseCoordsFromState() {
  return state.videoCoords.split(" ").reduce((acc, cur) => {
    const prev = acc[acc.length - 3] || 0;
    return acc.concat(prev + cur * 1.0)
  }, [])
}

function updateIndicatorPos(evt) {
  if (!videoCoords) return;
  window.mapUpdateIndicatorFromVideo(video, videoCoords);
}

function setVideo() {
  if (state.videoHash) {
    playVideo()
  } else {
    removeVideo()
  }
}

let video = null;
let videoCoords = null;
let prevVideo = null;
let prevStartTimeMs = 0;



window.videoStateChanged = setVideo;
setVideo()
