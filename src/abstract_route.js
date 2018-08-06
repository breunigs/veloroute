const hideAll = () => {
  for(let el of document.querySelectorAll(".desc")) {
    el.style.display = 'none';
  }
  document.getElementById('info').style.display = 'none';
}

const showRoute = (routeName) => {
  hideAll();
  const id = routeName ? `desc${routeName}` : 'info';
  console.debug(`Showing route=${id}`)
  document.getElementById(id).style.display = 'block';
};

export { showRoute };
