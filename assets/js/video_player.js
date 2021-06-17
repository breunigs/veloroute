function reverseVideo() {
  window.pushEvent('video-reverse', {
    lon: window.state.lon,
    lat: window.state.lat
  })
}

function attachHlsErrorHandler(obj, Hls) {
  obj.on(Hls.Events.ERROR, function (event, data) {
    if (data.fatal) {
      console.warn('Hls encountered a fatal error. Destroying it and letting the browser use one of the fallbacks.', event, data);
      window.hls = false;
      obj.destroy();
    } else {
      console.log('Hls encountered an error', event, data);
    }
  });
}

function updateVideoElement() {
  console.debug('trying to play video for: ', state.videoHash)
  video = document.getElementById('videoInner');
  video.addEventListener('loadedmetadata', seekToStartTime);
  video.addEventListener('timeupdate', updateIndicatorPos);

  const time = `#t=${state.videoStart / 1000.0}`;
  const path = `/videos-rendered/${state.videoHash}/`;
  // codec version for h264 can be determined through (Debian package: gpac)
  // MP4Box -info fallback.mp4 2>&1 | grep RFC6381 | awk '{print $4}'
  const innerHTML = `
    <source src="${path}stream.m3u8${time}" type="application/x-mpegURL">
    <source src="${path}fallback.webm${time}" type="video/webm; codecs=vp9">
    <source src="${path}fallback.mp4${time}" type="video/mp4; codec=avc1.64001E">
    <p>Abspielen im Browser klappt wohl nicht. Du kannst das <a href="${path}fallback.mp4" target="_blank">Video herunterladen</a> und anderweitig anzuschauen.</p>
  `;

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
      window.hls.loadSource(`${path}stream.m3u8`);
      video.innerHTML = innerHTML;
    })
    return
  }

  video.innerHTML = innerHTML;
  video.load();
}

function seekToStartTime() {
  if (prevStartTimeMs == state.videoStart) return;
  console.debug("seeking to", state.videoStart)
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
    updateVideoElement();
    videoCoords = parseCoordsFromState();
    return;
  }

  if (prevStartTimeMs != state.videoStart) {
    seekToStartTime();
    video.pause();
  }
}

function removeVideo() {
  console.debug("removing video (if there is)")
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
window.reverseVideo = reverseVideo;
setVideo()
