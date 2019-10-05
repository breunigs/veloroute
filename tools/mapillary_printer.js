let prevKey = null;

function printStuffs() {
  let pKey = history.state.pKey;
  if(prevKey == pKey) return;
  prevKey = pKey;
  console.log(pKey);
  fetch('https://a.mapillary.com/v3/images/'+pKey+'?client_id=MjFBX2pVMXN2aUlrSXFCVGlYMi11dzo4Yjk0NGY1MjMzYmExMzI2')
    .then(resp => resp.json())
    .then(json => json.properties.sequence_key)
    .then(function(sKey) {
      document.querySelector(".mapboxgl-ctrl.mapboxgl-ctrl-attrib").innerHTML = '<b><tt>{ "seq": "'+sKey+'", "from": "'+pKey+'", "to": "'+pKey+'" },</tt></b>';
    })
}

window.setInterval(printStuffs, 100);
printStuffs();
