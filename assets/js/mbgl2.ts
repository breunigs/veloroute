import * as maplibregl from 'maplibre-gl';
window.mlgl = maplibregl;

// the worker is a separate file since v6, resolved via import.meta.url which
// esbuild can't provide. Taking the URL from the script tag keeps its digest in
// sync with this bundle.
const workerUrl = (document.currentScript as HTMLScriptElement).dataset.workerUrl
if (workerUrl) window.mlgl.setWorkerUrl(workerUrl)

window.mlgl.setWorkerCount(2);
window.mlgl.prewarm();
