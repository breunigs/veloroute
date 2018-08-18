import {id2details, key2id} from '../routes/geo/quality_export.json';

const el = document.getElementById('quality');
const header = document.getElementById('qualityheader');

const osmLink = (osmId) => {
  return `<a href="https://www.openstreetmap.org/way/${osmId}">Weg in der OpenStreetMap anzeigen</a>`;
}

const considerOnlyThisSide = (observations) => {
  const firstSide = observations[0].split("_")[0];
  const onlyOneSide = observations.every(obs => obs.split("_", 1)[0] === firstSide);
  if(onlyOneSide) return firstSide;

  let counts = {};
  observations.map(obs => {
    const noSide = obs.replace(/^[^_]+_/, '');
    counts[noSide] = (counts[noSide] || 0) + 1;
  });
  const bothSidesEqual = Object.values(counts).every(v => v === 2);
  return bothSidesEqual ? firstSide : null;
}

const locSurfaces = {
  asphalt: "Teer",
  concrete: "Beton",
  metal: "Metall",
  paving_stones: '<span title="Die Oberfläche der Steine ist eben und die Spalten zwischen den Steinen vernachlässigbar. Unebenheit entsteht wenn sich die Steine im Laufe der Zeit leicht neigen.">Pflaster</span>',
  sett: '<span title="Die Oberfläche der Steine ist mehr oder weniger eben. Die meist fingerbreiten Spalten zwischen den Steinen sorgen für erhebliche Unebenheit. In Deutschland auch unter „Kopfsteinpflaster“ geläufig, obwohl dies genau genommen falsch ist.">grobes Pflaster</span>',
  cobblestone: '<span title="Der Straßenbelag besteht aus runden (oder kopfförmigen) Steinen mit erheblichen Spaltabständen. Echter Kopfstein ist in Hamburg extrem selten – meist ist nur „sehr grobes Pflaster“ gemeint.">Kopfsteinpflaster</span>',
  fine_gravel: 'feiner Schotter',
  gravel: 'grober Schotter',
  wood: 'Holzbalken'
}
const tSurface = (surface) => {
  if(!surface) return null;
  if(locSurfaces[surface]) return locSurfaces[surface];

  if(surface.indexOf(";") >= 0) return `<span title="Wert in der OpenStreetMap: ${surface.replace('"', '')}">wechselnder Belag</span>`;
  return `<span title="Wert in der OpenStreetMap: ${surface.replace('"', '')}">Unbekannte Oberfläche</span>`;
}

const locSmoothness = {
  excellent: "sehr eben",
  good: "größtenteils eben",
  intermediate: "eher uneben",
  bad: "erhebliche Unebenheiten"
}
const tSmoothness = (smoothness) => {
  if(!smoothness) return null;
  return locSmoothness[smoothness] || `<span title="Wert in der OpenStreetMap: ${smoothness.replace('"', '')}">Unbekannter Ebenheitsgrad</span>`;
}

const locRating = {
  excellent: "gut",
  okay: "okay",
  bad: "schlecht"
}
const tRating = (rating) => {
  return locRating[rating]
}

const locInternalType = {
  track_single: '<span title="Mindestbreite: 1,6m. Regelbreite: 2,0m.">eigener Radweg</span>',
  track_dual_true_false: '<span title="Mindestbreite: 2,5m. Regelbreite: 3,0m. Für gemischte Rad- und Fußwege kenne ich keine expliziten Breitenangaben. Daher werden diese Wege wie Zweirichtungsradwege behandelt.">Geteilter Rad/Fußweg</span>',
  track_dual_false_true: '<span title="Mindestbreite: 2,5m. Regelbreite: 3,0m.">Zweirichtungsradweg</span>',
  track_dual_true_true: '<span title="Mindestbreite: 2,5m. Regelbreite: 3,0m. Für gemischte Rad- und Fußwege kenne ich keine expliziten Breitenangaben. Daher werden diese Wege wie Zweirichtungsradwege behandelt.">Zweirichtungsradweg und Fußweg</span>',
  lane: '<span title="Mindestbreite: 1,25m. Regelbreite: 1,6m. Durchgezogene Linie, darf von KFZ nicht benutzt werden (außer zum Queren).">Radfahrstreifen</span>',
  shared_lane: '<span title="Mindestbreite: 1,25m. Regelbreite: 1,5m. Gestrichelte Linie, darf von KFZ im Bedarfsfall befahren werden. Halten ist für kurze Zeit erlaubt.">Schutzstreifen</span>'
}
const tInternalType = (internalType, sharedWithBikes, sharedWithPedestrians) => {
  return locInternalType[internalType] || locInternalType[`${internalType}_${sharedWithBikes}_${sharedWithPedestrians}`] || `<span title="interner Wert: ${internalType.replace('"', '')}">Unbekannter Wegtyp</span>`;
}

const locPathPosition = {
  shared: 'auf der Straße',
  separate: 'ohne KFZ',
  track: 'baulich getrennt',
  lane: 'Radfahrstreifen'
}
const tPathPosition = (pathPos) => {
  return locPathPosition[pathPos] || `<span title="interner Wert: ${pathPos.replace('"', '')}">Unbekannte Führung</span>`;
}

const locTopic = {
  surface: 'Oberfläche',
  width: 'Breite',
  not_lit: 'Beleuchtung',
  maxspeed_and_segregation: 'Führung'
}
const tTopic = (topic) => {
  return locTopic[topic] || topic;
}

const niceJoin = (main, extras) => {
  main = tRating(main);
  const tmp = extras.filter(e => e).join(", ");
  return tmp ? `${main} (${tmp})` : main;
}

const explainObservation = (topic, side, rating, details) => {
  switch(topic) {
    case "surface":
      const surf = tSurface(details[`${side}_surface`]);
      const smoo = tSmoothness(details[`${side}_smoothness`]);
      return niceJoin(rating, [surf, smoo]);

    case "width":
      const width = details[`${side}_width`];
      const internalType = details[`${side}_path_internal_type`];
      const sharedWithBikes = details[`${side}_shared_with_other_bikes`];
      const sharedWithPedestrians = details[`${side}_shared_with_pedestrians`];
      const internalTypeText = tInternalType(internalType, sharedWithBikes, sharedWithPedestrians);
      return niceJoin(rating, [`ca. ${width.replace(".", ",")}m`, internalTypeText]);

    case "not_lit":
      return niceJoin(rating, ["fehlt"]);

    case "maxspeed_and_segregation":
      const maxspeed = details[`${side}_maxspeed`];
      const maxspeedText = maxspeed ? `max. ${maxspeed} km/h` : null;
      const pathPos = tPathPosition(details[`${side}_path_position`]);
      return niceJoin(rating, [pathPos, maxspeedText]);

    default:
      return rating;
  }
}

const observation2text = (topic, ratings, details) => {
  const explained = Object.entries(ratings).map(([side, rating]) => {
    return explainObservation(topic, side, rating, details);
  });
  const same = explained.every(v => v === explained[0]);

  let html = `<th>${tTopic(topic)}</th>`;
  if(same) {
    html += `<td colspan=2>${explained[0]}</td>`;
  } else {
    html += explained.map(e => `<td>${e}</td>`).join('');
  }
  return html;
};


const showForKey = (image_key, avoidScrolling) => {
  const osm_id = key2id[image_key];
  const details = id2details[osm_id];
  console.debug("Quality Details:", details);
  if(!details) return;

  let obs = {};
  details.observations.forEach(ob => {
    const [_, side, topic, rating] = ob.match(/^([^_]+)_(.*)_([^_]+)$/);
    if(!obs[topic]) obs[topic] = {};
    obs[topic][side] = rating;
  });
  // console.debug("Partitioned Observations", obs);

  let html = '<table>';
  for (const [topic, ratings] of Object.entries(obs)) {
    html += '<tr>'
    html += observation2text(topic, ratings, details);
    html += '</tr>'
  }
  html += '</table>';

  el.innerHTML = html + osmLink(details.osm_id);
  if(!avoidScrolling) header.scrollIntoView();
}


export class Quality {
  constructor(state, imagesPromise) {
    this._state = state;
    this._previousQualityKey = null;

    this.showForKey = showForKey.bind(this);
    this.indicatorListener = this.indicatorListener.bind(this);

    imagesPromise.then(({addIndicatorListener}) => addIndicatorListener(this.indicatorListener))
    showForKey(this._state.currentImage(), true);
  }

  async indicatorListener(_lon, _lat, _ca, key) {
    if(this._state.selectedRoute() !== "quality") return;
    if(this._previousQualityKey === key) return;
    this._previousQualityKey = key;
    showForKey(key);
  }
}
