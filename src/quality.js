const el = document.getElementById('quality');

const osmLink = (osmId) => {
  return `<a href="https://www.openstreetmap.org/way/${osmId}">Weg in der OpenStreetMap anzeigen</a>`;
}

const oneSideOnly = (properties) => {
  const firstSide = properties.observations.first.split("_")[0];
  return properties.observations.every(obs => obs.split("_")[0] === firstSide);
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
  return locSurfaces[surface] || `<span title="Wert in der OpenStreetMap: ${surface.replace('"', '')}">Unbekannte Oberfläche</span>`
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

const niceJoin = (main, extras) => {
  const tmp = extras.filter(e => e).join(", ");
  return tmp ? `${main} (${tmp})` : main;
}

const observation2text = (observation, properties) => {
  const [_, side, topic, rating] = observation.match(/^([^_]+)_(.*)_([^_]+)$/);
  switch(topic) {
    case "surface":
      const surf = tSurface(properties[`${side}_surface`]);
      const smoo = tSmoothness(properties[`${side}_smoothness`]);
      const details = niceJoin(tRating(rating), [surf, smoo]);
      return `<dd>Oberfläche</dd><dt>${details}</dt>`
    case "width":
      // TODO: oneway/bothways + track type
      return `<dd>Breite</dd><dt>ca. ${properties[`${side}_width`]}m (TODO)</dt>`
    case "not_lit":
      return `<dd>Beleuchtung</dd><dt>fehlt</dt>`
    case "maxspeed_and_segregation":
      return `<dd>Führung</dd><dt>TODO</dt>`
    default:
      return `Unknown observation: ${topic} (${observation})`;
  }
};


const quality = (properties) => {
  console.debug(properties)
  const obs = properties.observations.split(",");

  let html = '';
  if(oneSideOnly) {
    html += `<dl class="w50">${obs.map(o => observation2text(o, properties)).join('')}</dl>`
  }

  el.innerHTML = html + osmLink(properties.osm_id);
  el.scrollIntoView();
}

export { quality };
