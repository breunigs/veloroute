async function checkWebGL() {
  const canvas = document.createElement("canvas");
  const gl = canvas.getContext("webgl") || canvas.getContext("experimental-webgl");
  if(!gl || !(gl instanceof WebGLRenderingContext)) {
    document.getElementsByTagName("body")[0].classList.add("nowebgl");
  }
}

checkWebGL();
