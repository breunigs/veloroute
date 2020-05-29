const htmlElem = document.getElementsByTagName("html")[0];
document.getElementById("switcher").addEventListener("click", () => {
  if(htmlElem.scrollLeft < 100) {
    htmlElem.scrollBy({left: 1000, top: 0, behavior: 'smooth'});
  } else {
    htmlElem.scrollBy({left: -1000, top: 0, behavior: 'smooth'});
  }
})

function detectswipe(el) {
  const ele = document.getElementById(el);
  const content = document.getElementById("content");

  let sX = 0;
  let sY = 0;
  let eX = 0;
  let eY = 0;

  const minX = 30;  // min x swipe for horizontal swipe
  const maxY = 30;  // max y difference for horizontal swipe

  ele.addEventListener('touchstart',  (e) => {
    const t = e.touches[0];
    sX = t.screenX;
    sY = t.screenY;
  }, {capture: false, passive: true});

  ele.addEventListener('touchmove',  (e) => {
    const t = e.touches[0];
    eX = t.screenX;
    eY = t.screenY;
  }, {capture: false, passive: true});

  ele.addEventListener('touchend', (e) => {
    if (
        ((eX - minX > sX) || (eX + minX < sX)) &&
        ((eY < sY + maxY) && (sY > eY - maxY)) &&
        (eX > 0)
      ) {

      if(eX > sX) {
        // swiped right
        htmlElem.scrollBy({left: -1000, top: 0, behavior: 'smooth'});
      } else {
        // swiped left
        htmlElem.scrollBy({left: 1000, top: 0, behavior: 'smooth'});
      }
    }

    sX = 0;
    sY = 0;
    eX = 0;
    eY = 0;
  }, {capture: false, passive: true});
}

detectswipe("sidebar")
detectswipe("switcher")
