import Hls from "../vendor/hls.light-iframes.min.js"

interface IframePlayer {
  attachMedia(el: HTMLVideoElement): void
  loadMediaAt(time: number): void
}

export type HlsWithIframes = import("hls.js").default & {
  iframeVariants?: unknown[]
  createIFramePlayer(): IframePlayer | null
}

const once = { once: true }

let hlsIframesOnly: IframePlayer | null = null
let thumbnailPreviewEl: HTMLVideoElement
let progressPreviewEl: HTMLElement

function setup(hls: HlsWithIframes): void {
  hls.once(Hls.Events.INIT_PTS_FOUND, () => setupThumbnailPreview(hls))
  hls.on(Hls.Events.DESTROYING, hideThumbnailPreview)
}

function setupThumbnailPreview(hls: HlsWithIframes): void {
  hlsIframesOnly = null
  if (window.matchMedia("(max-width: 768px)").matches) return hideThumbnailPreview()
  if (!hls.iframeVariants?.length) return hideThumbnailPreview()

  hlsIframesOnly = hls.createIFramePlayer()
  if (!hlsIframesOnly) return hideThumbnailPreview()

  hlsIframesOnly.attachMedia(thumbnailPreviewEl)
  thumbnailPreviewEl.addEventListener("seeked", () => {
    requestAnimationFrame(() => progressPreviewEl?.classList.add("has-thumbnail"))
  }, once)
}

function hideThumbnailPreview(): void {
  requestAnimationFrame(() => progressPreviewEl?.classList.remove("has-thumbnail"))
}

function seekTo(timeInSeconds: number): void {
  if (!hlsIframesOnly) return
  hlsIframesOnly.loadMediaAt(timeInSeconds)
}

export function initThumbnailPreview(thumbnailPreviewID: string, progressPreviewID: string) {
  const newEl = document.getElementById(thumbnailPreviewID) as HTMLVideoElement
  if (thumbnailPreviewEl !== newEl) {
    thumbnailPreviewEl = newEl
    progressPreviewEl = document.getElementById(progressPreviewID) as HTMLElement
  }
  return { setup, seekTo }
}
