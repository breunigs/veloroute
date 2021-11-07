const fKey = 'F'.charCodeAt(0);
window.onkeydown = function (e) {
  if (e.ctrlKey && e.keyCode == fKey) {
    const el = document.getElementById("query");
    if (el == document.activeElement) return;

    e.preventDefault();
    window.pushEvent("search", {
      value: null
    });

    if (el) {
      el.focus();
      el.select();
    }
  }
}
