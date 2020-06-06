let prevKey = null;
let leTimeout = null;

function printStuffs() {
  let pKey = history.state.pKey;
  if (prevKey == pKey) return;
  document.querySelector(".mapboxgl-ctrl.mapboxgl-ctrl-attrib").innerHTML = '<b><tt>- { seq: "<span style="user-select: all" id="seqkey">??????????????????????</span>", from: "<span style="user-select: all">' + pKey + '</span>", to: "<span style="user-select: all">' + pKey + '</span>" }</tt></b>';
  prevKey = pKey;
  console.log(pKey);
  if (leTimeout) { clearTimeout(leTimeout); }
  leTimeout = setTimeout(fetchStuffs, 100);
}

function fetchStuffs() {
  let pKey = history.state.pKey;
  fetch('https://a.mapillary.com/v3/images/' + pKey + '?client_id=MjFBX2pVMXN2aUlrSXFCVGlYMi11dzo4Yjk0NGY1MjMzYmExMzI2')
    .then(resp => resp.json())
    .then(json => json.properties.sequence_key)
    .then(function (sKey) {
      document.querySelector("#seqkey").innerHTML = sKey;
    })
}

window.setInterval(printStuffs, 10);
printStuffs();
