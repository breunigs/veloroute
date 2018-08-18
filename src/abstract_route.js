const gpxlink = document.getElementById('gpxlink');
const extras = document.getElementById('extras');
const info = document.getElementById('info');

const hideAll = () => {
  for(let el of document.querySelectorAll(".desc")) {
    el.style.display = 'none';
  }
  info.style.display = 'none';
}

let qualityPromise = null;
const loadQuality = (imagesPromise, state) => {
  if(qualityPromise) return qualityPromise;
  qualityPromise = import(/* webpackChunkName: "quality" */ './quality');

  // follow quality display on image change
  Promise.all([qualityPromise, imagesPromise]).then(([{quality}, {addIndicatorListener}]) => {
    let previousQualityKey = null;
    async function showQuality(_lon, _lat, _ca, key) {
      if(state.selectedRoute() !== "quality") return;
      if(previousQualityKey === key) return;
      previousQualityKey = key;
      quality(key);
    }
    quality(state.currentImage(), true);
    addIndicatorListener(showQuality);
  })

  return qualityPromise;
}

async function showRoute(routeName, imagesPromise, state) {
  hideAll();
  const id = routeName ? `desc${routeName}` : 'info';
  document.getElementById(id).style.display = 'block';

  if(routeName && routeName.match(/[0-9]/)) {
    extras.style.display = 'block';
    gpxlink.setAttribute('href', `routes/geo/route${routeName}.gpx`);
  } else {
    extras.style.display = 'none';
  }

  if(routeName === "quality") loadQuality(imagesPromise, state);
};

export { showRoute };
