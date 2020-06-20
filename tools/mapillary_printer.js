let prevKey = null;

function printStuffs() {
  let pKey = history.state.pKey;
  if (prevKey == pKey) return;
  prevKey = pKey;

  document.getElementById("OptionsIconContainer").click();
  let seq = document.querySelectorAll("app-copy-field input")[1].value
  document.getElementById("OptionsIconContainer").click();

  document.querySelector(".mapboxgl-ctrl.mapboxgl-ctrl-attrib").innerHTML = '<b><tt>- { seq: "<span style="user-select: all" id="seqkey">' + seq + '</span>", from: "<span style="user-select: all">' + pKey + '</span>", to: "<span style="user-select: all">' + pKey + '</span>" }</tt></b>';

  // fix wrong sequence key
  setTimeout(function () {
    prevKey = null;
    printStuffs();
  }, 1000);
}

window.setInterval(printStuffs, 100);
printStuffs();
