const el = document.getElementById('quality');

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

const niceJoin = (main, extras) => {
  main = tRating(main);
  const tmp = extras.filter(e => e).join(", ");
  return tmp ? `${main} (${tmp})` : main;
}

const observation2text = (observation, properties) => {
  const [_, side, topic, rating] = observation.match(/^([^_]+)_(.*)_([^_]+)$/);
  switch(topic) {
    case "surface":
      const surf = tSurface(properties[`${side}_surface`]);
      const smoo = tSmoothness(properties[`${side}_smoothness`]);
      const surf_details = niceJoin(rating, [surf, smoo]);
      return `<th>Oberfläche</th><td>${surf_details}</td>`
    case "width":
      const width = properties[`${side}_width`];
      const internalType = properties[`${side}_path_internal_type`];
      const sharedWithBikes = properties[`${side}_shared_with_other_bikes`];
      const sharedWithPedestrians = properties[`${side}_shared_with_pedestrians`];
      // TODO: oneway/bothways + track type
      const internalTypeText = tInternalType(internalType, sharedWithBikes, sharedWithPedestrians);
      const widthDetails = niceJoin(rating, [`ca. ${width.replace(".", ",")}m`, internalTypeText]);
      return `<th>Breite</th><td>${widthDetails}</td>`;
    case "not_lit":
      return `<th>Beleuchtung</th><td>${niceJoin(rating, ["fehlt"])}</td>`
    case "maxspeed_and_segregation":
      const maxspeed = properties[`${side}_maxspeed`];
      const maxspeedText = maxspeed ? `max. ${maxspeed} km/h` : '';
      const pathPos = tPathPosition(properties[`${side}_path_position`]);

      const segreDetails = niceJoin(rating, [pathPos, maxspeedText]);
      return `<th>Führung</th><td>${segreDetails}</td>`
    default:
      return `<th>${topic}</th><td>${observation}</td>`;
  }
};


const quality = (properties) => {
  console.debug(properties)
  const obs = properties.observations.split(",");

  let html = '<table>';
  const side = considerOnlyThisSide(obs);
  if(side) {
    const asText = obs.filter(o => o.startsWith(side)).map(o => observation2text(o, properties));
    html += `<tr>${asText.join('</tr><tr>')}</tr>`
  }
  html += '</table>';

  el.innerHTML = html + osmLink(properties.osm_id);
  el.scrollIntoView();
}

export { quality };
