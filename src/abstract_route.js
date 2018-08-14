const gpxlink = document.getElementById('gpxlink');
const extras = document.getElementById('extras');
const info = document.getElementById('info');

const hideAll = () => {
  for(let el of document.querySelectorAll(".desc")) {
    el.style.display = 'none';
  }
  info.style.display = 'none';
}

async function showRoute(routeName) {
  hideAll();
  const id = routeName ? `desc${routeName}` : 'info';
  document.getElementById(id).style.display = 'block';

  if(routeName && routeName.match(/[0-9]/)) {
    extras.style.display = 'block';
    gpxlink.setAttribute('href', `routes/geo/route${routeName}.gpx`);
  } else {
    extras.style.display = 'none';
  }
};

export { showRoute };
