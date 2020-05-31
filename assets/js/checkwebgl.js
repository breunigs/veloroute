function checkWebGL() {
  const canvas = document.createElement("canvas");
  const gl = canvas.getContext("webgl") || canvas.getContext("experimental-webgl");
  if (!gl || !(gl instanceof WebGLRenderingContext)) {
    console.warn("no webgl support?");
    document.getElementsByTagName("body")[0].classList.add("nowebgl");
  }
}

window.setTimeout(checkWebGL, 1000);
