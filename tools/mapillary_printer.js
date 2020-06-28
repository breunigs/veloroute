var prevKey = null;

function getSeq() {
  document.getElementById("OptionsIconContainer").click();
  var seq = document.querySelectorAll("app-copy-field input")[1].value
  document.getElementById("OptionsIconContainer").click();
  return seq;
}

function render(pKey, seq) {
  document.querySelector(".mapboxgl-ctrl.mapboxgl-ctrl-attrib").innerHTML = '<b><tt>- { seq: "<span style="user-select: all" id="seqkey">' + seq + '</span>", from: "<span style="user-select: all">' + pKey + '</span>", to: "<span style="user-select: all">' + pKey + '</span>" }</tt></b>';
}

function printStuffs() {
  var pKey = history.state.pKey;
  if (prevKey == pKey) return;
  prevKey = pKey;

  var seq = getSeq();
  render(pKey, seq);
  // fix wrong sequence key
  setTimeout(function () {
    var newSeq = getSeq();
    if (newSeq != seq) render(history.state.pKey, newSeq);
  }, 1000);
}

window.setInterval(printStuffs, 100);
printStuffs();
