function clear() {
  if(loadingTimer) {
    clearTimeout(loadingTimer);
    loadingTimer = null;
  }
}

function cls() {
  return document.getElementsByTagName("body")[0].classList;
}

let lastTimeStamp = null;
function ignore(info) {
  const prev = lastTimeStamp;
  lastTimeStamp = info.timeStamp;

  if(prev == null) return false;
  if(prev < info.timeStamp) return false;
  return true;
}

window.loadingCb = function() {
  clear()
  cls().remove("loading");
}

let loadingTimer = null;
window.addEventListener("phx:page-loading-start", info => {
  clear()
  setTimeout(() => {
    if(ignore(info)) return;
    console.debug("showing loading icon", info)
    cls().add("loading");
  }, 500);
})
window.addEventListener("phx:page-loading-stop", info => {
  if(ignore(info)) return;
  console.debug("removing loading icon", info);
  loadingCb();
})
