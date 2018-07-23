const showRoute = (routeName) => {
  if(!routeName) return;
  for(let el of document.querySelectorAll(".desc")) {
    el.style.display = 'none';
  }
  document.getElementById(`desc${routeName}`).style.display = 'block';
};

export { showRoute };
