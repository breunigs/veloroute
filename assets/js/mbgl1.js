// limit mapbox tracking
try {
  if (window.localStorage) window.localStorage.clear();
} catch (e) {}
import mapboxgl from 'mbgl1';
window.mapboxgl = mapboxgl;
