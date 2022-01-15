const fKey = 'F'.charCodeAt(0);
let prevSearchValue = '';
window.onkeydown = function (e) {
  const el = document.getElementById("query");
  if (e.ctrlKey && e.keyCode == fKey) {
    if (el == document.activeElement) return;

    e.preventDefault();
    if (el) {
      el.focus();
      el.select();
    } else {
      // i.e. force a switch to the search page
      window.pushEvent("search", {
        value: null
      });
    }
  } else if (el == document.activeElement && e.keyCode == 13) {
    // i.e. search immediately upon enter
    if (prevSearchValue == el.value) return;
    prevSearchValue = el.value;
    window.pushEvent("search", {
      value: el.value
    });
  }
}
