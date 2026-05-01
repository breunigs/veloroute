const once = { once: true }
const passive = { passive: true }

const minuteInMs = 60 * 1000
const hourInMs = 60 * minuteInMs

function pad0(num: number): string {
  return num < 10 ? "0" + num : String(num)
}

function ms2text(ms: number): string {
  const hours = Math.floor(ms / hourInMs)
  ms -= hours * hourInMs
  const minutes = Math.floor(ms / minuteInMs)
  ms -= minutes * minuteInMs
  const seconds = Math.floor(ms / 1000)
  if (hours > 0) return `${hours}:${pad0(minutes)}:${pad0(seconds)}`
  return `${minutes}:${pad0(seconds)}`
}

interface MetaText {
  recDate: string
  street: string
}

interface ProgressBarOpts {
  thumbnailPreview?: { seekTo(t: number): void } | null
  getMetaText?: ((timeMs: number) => MetaText) | null
  getVideoTimeMs?: () => number
  getDuration?: () => number
}

let progressEl: HTMLProgressElement
let progressWrapperEl: HTMLElement
let currentTimeEl: HTMLElement
let durationEl: HTMLElement
let progressPreviewEl: HTMLElement
let progressPreviewTextEl: HTMLElement
let videoEl: HTMLVideoElement

let onSeekCallback: (timeMs: number) => void
let currentOpts: ProgressBarOpts = {}

let seekByTouch = false
let progressPreviewRAF: number | null = null
let progressLoadedPercent = 0.0
let isSeeking = false
let trackedVideoTimeInMs = 0

function resolvedDuration(): number {
  return (currentOpts.getDuration?.() ?? Math.round(videoEl.duration * 1000)) || 0
}

function resolvedVideoTimeMs(): number {
  return currentOpts.getVideoTimeMs?.() ?? trackedVideoTimeInMs
}

function timeFromProgressPosition(e: MouseEvent | TouchEvent): [number, number, number] {
  const max = resolvedDuration()
  const clientX = (e as MouseEvent).clientX ?? (e as TouchEvent).changedTouches?.[0].clientX

  const leftGrace = seekByTouch ? window.screen.width * 0.1 : 10
  const rightGrace = seekByTouch ? 0 : 10

  const target = e.target as HTMLElement
  const pos = clientX - target.offsetLeft - leftGrace
  const ratio = pos / (target.clientWidth - leftGrace - rightGrace)

  const time = Math.max(0, Math.min(max, ratio * max))
  return [time, pos + leftGrace, time / max]
}

function seekFromProgress(e: MouseEvent | TouchEvent): void {
  const [time] = timeFromProgressPosition(e)
  onSeekCallback(time)
}

function previewProgress(e: MouseEvent | TouchEvent): void {
  isSeeking = true
  progressPreviewRAF ||= requestAnimationFrame(() => {
    const [time, pos, ratio] = timeFromProgressPosition(e)
    if (currentOpts.getMetaText) {
      const { recDate, street } = currentOpts.getMetaText(time)
      let text = `${street}<br>${recDate}<br>`
      if (!isNaN(time)) text += `<b>${ms2text(time)}</b>`
      progressPreviewTextEl.innerHTML = text
    } else if (!isNaN(time)) {
      progressPreviewTextEl.innerHTML = `<b>${ms2text(time)}</b>`
    }
    progressPreviewEl.style.setProperty("--pos", `${pos}px`)
    progressPreviewRAF = null
    progressEl.style.setProperty("--loaded", ratio * 100 + "%")
    if (seekByTouch) renderProgressbar(time)
    if (!isNaN(time)) currentOpts.thumbnailPreview?.seekTo(time / 1000.0)
  })
}

function scrubStart(_e: TouchEvent): void {
  seekByTouch = true
  progressPreviewEl.classList.add("enabled")
  isSeeking = true
}

function scrubEnd(e: TouchEvent): void {
  progressPreviewEl.classList.remove("enabled")
  seekFromProgress(e)
  seekByTouch = false
  isSeeking = false
}

function scrubCancel(_e: Event): void {
  progressPreviewEl.classList.remove("enabled")
  renderProgressbar()
  seekByTouch = false
  isSeeking = false
}

function renderProgressbar(overrideMs?: number): void {
  if (videoEl.style.visibility === 'hidden') return
  const customTime = typeof overrideMs !== "undefined"

  if (seekByTouch && !customTime) return

  const ms = customTime ? overrideMs! : resolvedVideoTimeMs()
  const max = resolvedDuration()
  if (isNaN(ms) || isNaN(max)) return
  const msText = ms2text(ms)
  const maxText = ms2text(max)

  for (let i = 0; i < videoEl.buffered.length; i++) {
    const start = videoEl.buffered.start(i) * 1000
    const end = videoEl.buffered.end(i) * 1000
    if (start > ms) break
    if (end < ms) continue
    progressLoadedPercent = end / max * 100
  }

  window.requestAnimationFrame(() => {
    if (currentTimeEl.textContent !== msText) currentTimeEl.textContent = msText
    if (durationEl.textContent !== maxText) durationEl.textContent = maxText
    progressEl.value = ms
    progressWrapperEl.setAttribute("aria-valuenow", String(ms))
    if ((progressEl as any).max !== max) (progressEl as any).max = max
    if (!isSeeking) progressEl.style.setProperty("--loaded", progressLoadedPercent + "%")
  })
}

function onVideoProgress(): void {
  renderProgressbar()
}

function update(timeMs?: number): void {
  if (timeMs !== undefined) {
    videoEl.removeEventListener('progress', onVideoProgress)
    videoEl.addEventListener('seeked', () => {
      videoEl.addEventListener('progress', onVideoProgress)
    }, once)
  }
  renderProgressbar(timeMs)
}

function teardown(): void {
  if (progressPreviewRAF) {
    cancelAnimationFrame(progressPreviewRAF)
    progressPreviewRAF = null
  }
}

export function initProgressBar(
  progressWrapperID: string,
  videoID: string,
  onSeek: (timeMs: number) => void,
  opts?: ProgressBarOpts
): { update: (timeMs?: number) => void, teardown: () => void, progressWrapper: HTMLElement, currentEl: HTMLElement } {
  const newVideoEl = document.getElementById(videoID) as HTMLVideoElement
  if (videoEl !== newVideoEl) {
    videoEl = newVideoEl
    progressWrapperEl = document.getElementById(progressWrapperID)!
    progressEl = document.getElementById("progress") as HTMLProgressElement
    currentTimeEl = document.getElementById("current")!
    durationEl = document.getElementById("max")!
    progressPreviewEl = document.getElementById("progressPreview")!
    progressPreviewTextEl = document.getElementById("progressPreviewText")!

    progressWrapperEl.addEventListener('click', seekFromProgress)
    progressWrapperEl.addEventListener('mousemove', previewProgress, passive)
    progressWrapperEl.addEventListener('touchmove', previewProgress, passive)
    progressWrapperEl.addEventListener('touchstart', scrubStart, passive)
    progressWrapperEl.addEventListener('touchend', scrubEnd, passive)
    progressWrapperEl.addEventListener('touchcancel', scrubCancel, passive)
    progressWrapperEl.addEventListener('mouseenter', () => isSeeking = true, passive)
    progressWrapperEl.addEventListener('mouseout', scrubCancel, passive)

    videoEl.addEventListener('timeupdate', onVideoProgress)
    videoEl.addEventListener('progress', onVideoProgress)

    window.addEventListener('video:timeupdate', (e: Event) => {
      trackedVideoTimeInMs = (e as CustomEvent<{ timeInMs: number }>).detail.timeInMs
    })
  }

  onSeekCallback = onSeek
  currentOpts = opts ?? {}

  return { update, teardown, progressWrapper: progressWrapperEl, currentEl: currentTimeEl }
}
