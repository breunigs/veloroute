// limit mapbox tracking
try {
  if (window.localStorage) window.localStorage.clear();
} catch (e) {}
import mapboxgl from 'mbgl2';
window.mapboxgl = mapboxgl;
mapboxgl.prewarm();
