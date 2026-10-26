import * as maplibregl from 'maplibre-gl';
window.mlgl = maplibregl;

// the worker is a separate file since v6, resolved via import.meta.url which
// points at this bundle rather than the worker. Taking the URL from the script
// tag keeps its digest in sync with this bundle. This runs as a module, so
// document.currentScript is null.
const workerUrl = document.querySelector<HTMLScriptElement>('script[data-worker-url]')?.dataset.workerUrl
if (workerUrl) window.mlgl.setWorkerUrl(workerUrl)

window.mlgl.setWorkerCount(2);
window.mlgl.prewarm();
