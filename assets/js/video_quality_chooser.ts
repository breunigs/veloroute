import Hls from "../vendor/hls.light-iframes.min.js"

interface QualityChooserDOMRefs {
  videoQualityID: string
  videoQualityOptionsID: string
  videoOptionsID: string
  videoID: string
}

interface CodecInfo {
  name: string
  desc: string
}

const codecTranslate: Record<string, CodecInfo> = {
  avc1: { name: "H.264", desc: "mäßige Qualität, funktioniert praktisch überall" },
  av01: { name: "AV1", desc: "gute Qualität, auf Handys problematisch" },
}

const once = { once: true }
const passive = { passive: true }
const passiveOnce = { ...once, ...passive }

let hls: import("hls.js").default | null = null
let previouslyPlayingCodec: string | null = null
let updateQualityChooserRegistered = false
let updateQualityChooserForced = false

let videoOptions: HTMLElement
let videoQuality: HTMLElement
let videoQualityOptions: HTMLElement
let videoEl: HTMLVideoElement

function restorePreviousQuality() {
  if (!hls) return
  if (!previouslyPlayingCodec) return;
  for (let i = 0; i < hls.levels.length; i++) {
    if (JSON.stringify(hls.levels[i].attrs) == previouslyPlayingCodec) {
      hls.currentLevel = i;
      console.debug("restoring previously used quality")
      break
    }
  }
}

function teardown() {
  if (!hls) return

  try {
    if (hls.autoLevelEnabled) {
      previouslyPlayingCodec = null;
    } else {
      previouslyPlayingCodec = JSON.stringify(hls.levels[hls.currentLevel].attrs);
    }
  } catch (error) {
    console.warn(error)
  }

  hls = null
}

function selectVideoQuality(event: Event) {
  if (!hls) return hideQualityChooser();
  if (!videoEl) return console.warn("trying to select video quality without videoEl")

  const level = (event.target as HTMLElement).dataset.level;
  if (!level) return;
  if (videoEl.paused || videoEl.readyState <= 2) hls.currentLevel = Number(level);
  hls.nextLevel = Number(level);
  hls.loadLevel = Number(level);
  updateQualityChooser();
  window.plausible('videoQualityChanged')
}

function updateQualityChooserDelayed() {
  updateQualityChooserRegistered = false
  updateQualityChooserForced = true
  updateQualityChooser()
}

function updateQualityChooser() {
  if (!hls) return hideQualityChooser();
  // don't update if hidden
  if (!updateQualityChooserForced && window.getComputedStyle(videoQuality).visibility !== 'visible') {
    if (!updateQualityChooserRegistered) {
      updateQualityChooserRegistered = true
      videoOptions.addEventListener('touchstart', updateQualityChooserDelayed, passiveOnce)
      videoOptions.addEventListener('mouseenter', updateQualityChooserDelayed, passiveOnce)
    }
    return;
  }
  updateQualityChooserForced = false

  requestAnimationFrame(() => {
    if (!hls) return

    const current = hls.currentLevel;
    const next = hls.loadLevel;
    const auto = hls.autoLevelEnabled;

    let choosers = "";
    for (let i = hls.levels.length - 1; i >= 0; i--) {
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
      const mbits = hls.levels[i].bitrate / 1024 / 1024;
      const codecSet = hls.levels[i].codecSet;
      const codec = codecTranslate[codecSet] ?? { name: codecSet, desc: "Unbekannt" };
      let name = `${hls.levels[i].height}p`;
      const title = `${name} benötigt ca. ${Math.round(mbits)} MBit/s (Codec: ${codec.name}, ${codec.desc})`

      name += ` <small>${codec.name}</small>`
      choosers += `<a data-level="${i}" class="${classes}" title="${title}" role="menuitemradio" aria-checked="${checked}">${name}</a>`
    }
    choosers += `<a data-level="-1" class="${auto ? "active" : ""}" title="Wählt automatisch die bestmögliche Qualität. Was aktuell angezeigt wird, ist durch das Auge markiert.">automatisch</a>`

    videoQuality.style.display = 'block';
    videoQualityOptions.innerHTML = choosers;
  });
}

function hideQualityChooser() {
  videoQuality.style.display = 'none';
}

function hideVideoQualityOptions() {
  const hide = window.getComputedStyle(videoQualityOptions).visibility == 'visible';
  videoOptions.classList.toggle("hidden", hide)
}

function setupHls(instance: import("hls.js").default) {
  hls = instance
  hls.on(Hls.Events.MANIFEST_PARSED, restorePreviousQuality);
  hls.on(Hls.Events.MANIFEST_PARSED, updateQualityChooser);
  hls.on(Hls.Events.LEVEL_SWITCHING, updateQualityChooser);
  hls.on(Hls.Events.LEVEL_SWITCHED, updateQualityChooser);
  hls.on(Hls.Events.DESTROYING, hideQualityChooser);
}

export function initQualityChooser({ videoQualityID, videoQualityOptionsID, videoOptionsID, videoID }: QualityChooserDOMRefs) {
  console.debug("init quality chooser")

  videoQuality = document.getElementById(videoQualityID)!
  videoEl = document.getElementById(videoID)! as HTMLVideoElement

  const newVideoQualityOptions = document.getElementById(videoQualityOptionsID)!
  if (videoQualityOptions !== newVideoQualityOptions) {
    videoQualityOptions = newVideoQualityOptions
    videoQualityOptions.addEventListener('click', selectVideoQuality);
  }

  const newVideoOptions = document.getElementById(videoOptionsID)!
  if (videoOptions !== newVideoOptions) {
    videoOptions = newVideoOptions
    // provide a way to close the options menu by clicking the gear icon again
    videoOptions.addEventListener('touchstart', hideVideoQualityOptions, passive);
  }

  return { teardown: teardown, setup: setupHls }
}
