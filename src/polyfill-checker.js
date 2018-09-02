if(typeof Promise !==  "function" ||
  typeof Symbol !==  "function" ||
  typeof URL !==  "function" ||
  typeof fetch !==  "function") {
  var script = document.createElement('script');
  // reference file with production hash here. For development mode in IE11,
  // simply uncomment the import below.
  script.src = "POLYFILL_LOADER_FILENAME";
  document.head.appendChild(script);
}
// import './polyfill-loader';
