import "../base.scss";

import { map, addRouteClickListener, addQualityClickListener, renderIndicator, toggleQuality, getRouteBelowIndicator } from "./map";
import { showRoute } from "./abstract_route";
import places from '../routes/geo/places.json';
import State from "./state";
import Swap from './swap';
import { addRouteChangeListener } from './state';

const state = new State(map);


const imagesPromise = import(/* webpackChunkName: "images" */ './images');
let qualityPromise = null;

let qualityTimeout = null;
let previousQualityLonLat = null;
async function showQualityBelowMarker(lon, lat, _ca, _key, bearingOnly) {
  if(bearingOnly) return;
  if(state.selectedRoute() !== "quality") return;

  const newLonLat = [lon, lat];
  if(previousQualityLonLat == newLonLat) return;
  previousQualityLonLat = newLonLat;

  clearTimeout(qualityTimeout);
  qualityTimeout = setTimeout(() => {
    const route = getRouteBelowIndicator()
    if(!route) return console.warn(`Couldn't find route close to ${newLonLat}, so cannot show quality.`);
    loadQuality().then(({quality}) => quality(route.properties));
  }, 100);
}

const loadQuality = () => {
  if(qualityPromise) return qualityPromise;
  qualityPromise = import(/* webpackChunkName: "quality" */ './quality');

  // follow quality display on image change
  qualityPromise.then(({quality}) => {
    imagesPromise.then(({addIndicatorListener}) => {
      addIndicatorListener(showQualityBelowMarker);
    });
  });

  return qualityPromise;
}

addRouteClickListener(state.routeSetter());
addRouteChangeListener(showRoute, toggleQuality);
addQualityClickListener((_name, _lngLat, _ignoreCurrentDirection, properties) => {
  loadQuality()//.then(({quality}) => quality(properties));
});

for(let el of document.querySelectorAll(".routing td a:not(.icon)")) {
  el.addEventListener('click', evt => {
    const placeName = evt.target.textContent;
    map.fitBounds(places[placeName], {maxZoom: 14.5});
  });
}

for(let el of document.querySelectorAll(".routing td a.icon")) {
  el.addEventListener('click', evt => {
    const routeName = evt.target.textContent;
    showRoute(routeName);
  });
}

showRoute(state.selectedRoute());


const infoLinks = document.querySelectorAll(".show-main-text");
for (let i = 0; i < infoLinks.length; i++) {
  infoLinks[i].addEventListener("click", state.routeResetter());
}
const qualityLinks = document.querySelectorAll(".show-quality");
for (let i = 0; i < qualityLinks.length; i++) {
  qualityLinks[i].addEventListener("click", () => {
    state.routeSetter()("quality");
  });
}

imagesPromise.then(({mlyViewer, addIndicatorListener, showCloseImage}) => {
  addIndicatorListener(renderIndicator, state.imageSetter());
  new Swap(map, mlyViewer);
  addRouteClickListener(showCloseImage);
  addQualityClickListener(showCloseImage);
});
