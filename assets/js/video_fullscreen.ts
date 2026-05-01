let outerEl: HTMLElement
let controlsEl: HTMLElement
let videoEl: HTMLVideoElement

let inactivityTimeout: ReturnType<typeof setTimeout> | null = null;

function isTouch() {
  return "ontouchstart" in window || navigator.maxTouchPoints > 0 || navigator.msMaxTouchPoints > 0;
}

function inactivityReset() {
  if (inactivityTimeout) {
    clearTimeout(inactivityTimeout);
    inactivityTimeout = null;
  }
  outerEl.classList.remove("inactivity");
}

function inactivityDelay() {
  inactivityReset()
  inactivityTimeout = setTimeout(() => {
    // don't hide the controls if the cursor is hovering them
    if (controlsEl.matches(':hover')) return;
    outerEl.classList.add("inactivity");
  }, 2000);
}

function inactivityListener(bool: boolean) {
  if (bool) {
    outerEl.addEventListener("mousemove", inactivityDelay);
    outerEl.addEventListener("touchmove", inactivityDelay);
    inactivityReset();
  } else {
    outerEl.removeEventListener("mousemove", inactivityDelay);
    outerEl.removeEventListener("touchmove", inactivityDelay);
    inactivityDelay();
  }
}

function launchIntoFullscreen(element: HTMLElement) {
  if ((element as any).requestFullscreen) {
    (element as any).requestFullscreen();
  } else if (videoEl.webkitSupportsPresentationMode && (videoEl as any).webkitSetPresentationMode == 'fullscreen') {
    (videoEl as any).webkitSetPresentationMode('fullscreen')
  } else if ((element as any).webkitRequestFullscreen && !isTouch()) {
    (element as any).webkitRequestFullscreen();
  } else {
    document.body.classList.add('fullscreen');
  }

  inactivityListener(true);
}

function exitFullscreen() {
  if (document.exitFullscreen) {
    document.exitFullscreen();
  } else if ((videoEl as any).webkitSetPresentationMode) {
    (videoEl as any).webkitSetPresentationMode('inline');
  } else if ((document as any).webkitExitFullscreen) {
    (document as any).webkitExitFullscreen();
  }

  inactivityListener(false);
  document.body.classList.remove('fullscreen');
}

function toggleFullscreen() {
  const fullscreenElement =
    document.fullscreenElement ||
    (document as any).webkitFullscreenElement ||
    (videoEl.webkitSupportsPresentationMode && (videoEl as any).webkitSetPresentationMode == 'fullscreen') ||
    document.body.classList.contains("fullscreen");
  if (fullscreenElement) {
    exitFullscreen();
  } else {
    launchIntoFullscreen(outerEl);
  }
}

export function initFullscreen(outerID: string, controlsID: string, videoID: string) {
  outerEl = document.getElementById(outerID)!
  controlsEl = document.getElementById(controlsID)!
  videoEl = document.getElementById(videoID)! as HTMLVideoElement

  return { toggle: toggleFullscreen }
}
