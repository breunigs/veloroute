import { default as maplibregl } from 'maplibre-gl';
window.mlgl = maplibregl;
window.mlgl.setWorkerCount(2);
window.mlgl.prewarm();
