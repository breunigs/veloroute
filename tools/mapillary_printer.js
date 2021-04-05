var prevKey = null;

function getSeq() {
  document.getElementById("OptionsIconContainer").click();
  var seq = document.querySelectorAll("app-copy-field input")[1].value
  document.getElementById("OptionsIconContainer").click();
  return seq;
}

function render(pKey, seq) {
  let elem = document.querySelector(".mapboxgl-ctrl.mapboxgl-ctrl-attrib");
  elem.style.padding = '2px 24px 2px 4px';
  elem.innerHTML = `
    <style>
      .vhhgroup {
        user-select: all;
        font: monospace;
      }
    </style>
    <div class="vhhgroup">seq_forward=${seq}<br>img_forward_start=${pKey}</div><br>
    <div class="vhhgroup">seq_forward=${seq}<br>img_forward_end=${pKey}</div><br>
    <div class="vhhgroup">seq_backward=${seq}<br>img_backward_start=${pKey}</div><br>
    <div class="vhhgroup">seq_backward=${seq}<br>img_backward_end=${pKey}</div>
  `;
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
