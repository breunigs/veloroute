import * as Hls from 'hls.js';

const wrapper = document.getElementById('videoOuter');
let prevVideo = null;

function playVideo(video_hash) {
  if (prevVideo == video_hash) {
    console.debug("desired video is already playing, not changing")
    return;
  }
  prevVideo = video_hash;

  console.debug('trying to play video for: ', video_hash)
  const stream = `/videos-rendered/${video_hash}/stream.m3u8`;
  const fallback = `/videos-rendered/${video_hash}/fallback.mp4`;

  wrapper.innerHTML = `
    <video id="videoInner" autoplay controls playsinline>
      <source src="${stream}" type="application/x-mpegURL">
      <source src="${fallback}" type="video/mp4">
    </video>
  `;
  const video = document.getElementById('videoInner');

  if (video.canPlayType('application/vnd.apple.mpegurl')) {
    console.debug('native hls, doing nothing?')
    // video.src = stream;
  } else if (Hls.isSupported()) {
    console.debug('streamed hls')
    var hls = new Hls();
    hls.loadSource(stream);
    hls.attachMedia(video);
  }
}

function removeVideo() {
  prevVideo = null;
  wrapper.innerHTML = '';
}

function setVideo() {
  if (state.video) {
    playVideo(state.video)
  } else {
    removeVideo()
  }
}

window.videoStateChanged = setVideo;
setVideo()
