const cls = document.getElementsByTagName("body")[0].classList;
document.getElementById("switcher").addEventListener("click", () => {
  cls.toggle("showSidebar");
})

function detectswipe(el) {
  const ele = document.getElementById(el);

  let sX = 0;
  let sY = 0;
  let eX = 0;
  let eY = 0;

  const minX = 30;  // min x swipe for horizontal swipe
  const maxY = 30;  // max y difference for horizontal swipe

  ele.addEventListener('touchstart', (e) => {
    const t = e.touches[0];
    sX = t.screenX;
    sY = t.screenY;
  }, { capture: false, passive: true });

  ele.addEventListener('touchmove', (e) => {
    const t = e.touches[0];
    eX = t.screenX;
    eY = t.screenY;
  }, { capture: false, passive: true });

  ele.addEventListener('touchend', (e) => {
    if (
      ((eX - minX > sX) || (eX + minX < sX)) &&
      ((eY < sY + maxY) && (sY > eY - maxY)) &&
      (eX > 0)
    ) {

      console.debug("swiped x", sX - eX, "swiped y", sY, eY);

      if (eX > sX) {
        // swiped right
        cls.remove("showSidebar");
      } else {
        // swiped left
        cls.add("showSidebar");
      }
    }

    sX = 0;
    sY = 0;
    eX = 0;
    eY = 0;
  }, { capture: false, passive: true });
}

detectswipe("sidebar")
detectswipe("switcher")
