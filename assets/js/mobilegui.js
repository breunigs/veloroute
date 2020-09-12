const cls = document.getElementsByTagName("body")[0].classList;

function showSidebar() {
  cls.add("showSidebar");
  cls.remove("hideSidebar");
}

function hideSidebar() {
  cls.remove("showSidebar");
  cls.add("hideSidebar");
}

function toggleSidebar(e) {
  cls.contains("showSidebar") ? hideSidebar() : showSidebar()
  e.stopPropagation()
}

document.getElementById("switcher").addEventListener("click", toggleSidebar)

function detectswipe(el) {
  const ele = document.getElementById(el);

  let sX = 0;
  let sY = 0;
  let eX = 0;
  let eY = 0;

  const minX = 30; // min x swipe for horizontal swipe
  const maxY = 50; // max y difference for horizontal swipe

  ele.addEventListener('touchstart', (e) => {
    const t = e.touches[0];
    sX = t.screenX;
    sY = t.screenY;
  }, {
    capture: false,
    passive: true
  });

  ele.addEventListener('touchmove', (e) => {
    const t = e.touches[0];
    eX = t.screenX;
    eY = t.screenY;
  }, {
    capture: false,
    passive: true
  });

  ele.addEventListener('touchend', (e) => {
    if (
      eX > 0 && Math.abs(sX - eX) > minX && Math.abs(sY - eY) < maxY
    ) {

      console.debug("swiped x", sX - eX, "swiped y", sY - eY);

      if (eX > sX) {
        // swiped right
        hideSidebar()
        if (document.activeElement.tagName === 'INPUT') {
          document.activeElement.blur();
        }
      } else {
        // swiped left
        showSidebar();
      }
    } else {
      if (e.target.tagName === 'INPUT') {
        showSidebar();
      }
    }

    sX = 0;
    sY = 0;
    eX = 0;
    eY = 0;
  }, {
    capture: false,
    passive: true
  });
}

detectswipe("sidebar")
detectswipe("switcher")
