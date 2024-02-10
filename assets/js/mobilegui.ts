const passive = {
  passive: true
}

let timeout: number | null

let cls: DOMTokenList | null
let content: HTMLElement | null
let sidebar: HTMLElement | null
let switcher: HTMLElement | null

function showSidebar(pos?: number) {
  if (!cls) return
  cls.add("showSidebar", "animateSidebar");
  cls.remove("hideSidebar");
  stopScroll(pos)
  disableAnimationAfter()
  switcher!.setAttribute("aria-expanded", "true");
  switcher!.setAttribute("aria-checked", "true");
}

function hideSidebar(pos?: number) {
  if (!cls) return
  cls.remove("showSidebar");
  cls.add("hideSidebar", "animateSidebar");
  stopScroll(pos)
  disableAnimationAfter()
  switcher!.setAttribute("aria-expanded", "false");
  switcher!.setAttribute("aria-checked", "false");
}

function disableAnimationAfter() {
  if (timeout != null) window.clearTimeout(timeout)
  timeout = window.setTimeout(() => {
    if (!cls) return
    cls.remove("animateSidebar");
    timeout = null
    // keep timeout in sync with main.scss
  }, 300 + 33)
}

function stopScroll(pos?: number) {
  if (pos === undefined) return
  content!.scrollTop = pos;
  content!.style.overflowY = "hidden";
  setTimeout(() => content!.style.overflowY = "auto", 50);
}

function toggleSidebar(e: Event) {
  if (!cls) return
  cls.contains("showSidebar") ? hideSidebar() : showSidebar()
  e.stopPropagation()
}

function showSidebarIfHidden(_e?: Event) {
  if (!cls) return false
  if (cls.contains("hideSidebar")) {
    showSidebar()
    return true
  }
  return false
}

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
    } else if (eY > 0 && Math.abs(sX - eX) < maxY && Math.abs(sY - eY) > minX) {
      acted = showSidebarIfHidden()
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
  }, passive);

  ele.addEventListener('touchmove', (e) => {
    const t = e.touches[0];
    eX = t.screenX;
    eY = t.screenY;

    act();
  }, passive);

  ele.addEventListener('touchend', (e) => {
    act(e);

    sX = 0;
    sY = 0;
    eX = 0;
    eY = 0;
    acted = false;
  }, passive);
}

function init() {
  // i.e. no-reinit needed
  if (sidebar === document.getElementById("sidebar")) return

  cls = document.getElementsByTagName("body")[0].classList;
  content = document.getElementById("content");
  sidebar = document.getElementById("sidebar");
  switcher = document.getElementById("switcher");

  switcher!.addEventListener("click", toggleSidebar)
  sidebar!.addEventListener("click", showSidebarIfHidden)
  sidebar!.addEventListener("wheel", showSidebarIfHidden, passive)

  detectswipe("sidebar")
  detectswipe("switcher")
}
init()
window.addEventListener("global:mounted", init)
