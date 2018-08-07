const gpxlink = document.getElementById('gpxlink');
const extras = document.getElementById('extras');
const info = document.getElementById('info');

const hideAll = () => {
  for(let el of document.querySelectorAll(".desc")) {
    el.style.display = 'none';
  }
  info.style.display = 'none';
}

const showRoute = (routeName) => {
  hideAll();
  const id = routeName ? `desc${routeName}` : 'info';
  console.debug(`Showing route=${id}`)
  document.getElementById(id).style.display = 'block';

  extras.style.display = routeName ? 'block' : 'none';

  if(routeName) {
    gpxlink.setAttribute("href", `routes/geo/route${routeName}.gpx`);
  }
};

export { showRoute };
