import { default as maplibregl } from 'maplibre-gl';
window.mlgl = maplibregl;
window.mlgl.workerCount = 2;
window.mlgl.prewarm();
