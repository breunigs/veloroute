let prevKey = null;
let leTimeout = null;

function printStuffs() {
  let pKey = history.state.pKey;
  if (prevKey == pKey) return;
  document.querySelector(".mapboxgl-ctrl.mapboxgl-ctrl-attrib").innerHTML = '<b><tt>- { seq: "<span style="user-select: all" id="seqkey">??????????????????????</span>", from: "<span style="user-select: all">' + pKey + '</span>", to: "<span style="user-select: all">' + pKey + '</span>" }</tt></b>';
  prevKey = pKey;
  console.log(pKey);
  if (leTimeout) { clearTimeout(leTimeout); }
  leTimeout = setTimeout(fetchStuffs, 500);
}

function fetchStuffs() {
  document.getElementById("OptionsIconContainer").click();
  let seq = document.querySelectorAll("app-copy-field input")[1].value
  document.getElementById("OptionsIconContainer").click();
  document.querySelector("#seqkey").innerHTML = seq;
}

window.setInterval(printStuffs, 10);
printStuffs();
