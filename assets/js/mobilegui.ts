const cls = document.getElementsByTagName("body")[0].classList;
const content = document.getElementById("content");

function showSidebar(pos?: number) {
  cls.add("showSidebar");
  cls.remove("hideSidebar");
  stopScroll(pos)
}

function hideSidebar(pos?: number) {
  cls.remove("showSidebar");
  cls.add("hideSidebar");
  stopScroll(pos)
}

function stopScroll(pos?: number) {
  if (pos === undefined) return
  content!.scrollTop = pos;
  content!.style.overflowY = "hidden";
  setTimeout(() => content!.style.overflowY = "auto", 50);
}

function toggleSidebar(e: Event) {
  cls.contains("showSidebar") ? hideSidebar() : showSidebar()
  e.stopPropagation()
}

document.getElementById("switcher")!.addEventListener("click", toggleSidebar)

function detectswipe(el: string) {
  const ele = document.getElementById(el)
  if (!ele) return

  let sX = 0;
  let sY = 0;
  let eX = 0;
  let eY = 0;

  const minX = 30; // min x swipe for horizontal swipe
  const maxY = 50; // max y difference for horizontal swipe

  let scrollStart = 0;
  let acted = false;

  const act = (event?: TouchEvent) => {
    if (acted) return;

    if (
      eX > 0 && Math.abs(sX - eX) > minX && Math.abs(sY - eY) < maxY
    ) {
      console.debug("swiped x", sX - eX, "swiped y", sY - eY)

      if (eX > sX) {
        // swiped right
        hideSidebar(scrollStart);
        acted = true;
        if (document.activeElement?.tagName === 'INPUT') {
          (document.activeElement as HTMLElement).blur();
        }
      } else {
        // swiped left
        showSidebar(scrollStart);
        acted = true;
      }
    } else {
      const target = event?.target
      if (target && (target as HTMLElement).tagName === 'INPUT') {
        showSidebar();
        acted = true;
      }
    }
  }

  ele.addEventListener('touchstart', (e) => {
    const t = e.touches[0];
    sX = t.screenX;
    sY = t.screenY;
    scrollStart = content!.scrollTop;
  }, {
    capture: false,
    passive: true
  });

  ele.addEventListener('touchmove', (e) => {
    const t = e.touches[0];
    eX = t.screenX;
    eY = t.screenY;

    act();
  }, {
    capture: false,
    passive: true
  });

  ele.addEventListener('touchend', (e) => {
    act(e);

    sX = 0;
    sY = 0;
    eX = 0;
    eY = 0;
    acted = false;
  }, {
    capture: false,
    passive: true
  });
}

detectswipe("sidebar")
detectswipe("switcher")