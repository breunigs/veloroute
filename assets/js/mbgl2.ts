import { default as mapboxgl } from 'mapbox-gl';
window.mapboxgl = mapboxgl;
mapboxgl.prewarm();
mapboxgl.baseApiUrl = window.location.origin + "/map"
