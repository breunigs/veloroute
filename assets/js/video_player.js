import * as Hls from 'hls.js';

const wrapper = document.getElementById('videoOuter');
let video = null;
let prevVideo = null;
let prevStartTimeMs = 0;

function updateVideoElement(videoHash) {
  console.debug('trying to play video for: ', videoHash)
  const stream = `/videos-rendered/${videoHash}/stream.m3u8`;
  const fallback = `/videos-rendered/${videoHash}/fallback.mp4`;

  wrapper.innerHTML = `
    <video id="videoInner" controls playsinline preload="metadata">
      <source src="${stream}#t=${state.videoStart / 1000.0}" type="application/x-mpegURL">
      <source src="${fallback}#t=${state.videoStart / 1000.0}" type="video/mp4">
    </video>
  `;
  video = document.getElementById('videoInner');
  video.addEventListener('loadedmetadata', seekToStartTime, { once: true });

  if (video.canPlayType('application/vnd.apple.mpegurl')) {
    console.debug('native hls, doing nothing?')
  } else if (Hls.isSupported()) {
    console.debug('streamed hls')
    var hls = new Hls();
    hls.loadSource(stream);
    hls.attachMedia(video);
  }
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
  wrapper.innerHTML = '';
}

function setVideo() {
  if (state.video) {
    playVideo()
  } else {
    removeVideo()
  }
}

window.videoStateChanged = setVideo;
setVideo()
