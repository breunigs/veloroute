const fKey = 'F'.charCodeAt(0);
window.onkeydown = function (e) {
  if (e.ctrlKey && e.keyCode == fKey) {
    e.preventDefault();
    window.pushEvent("search", { value: null });

    const el = document.getElementById("search");
    if (el) {
      el.focus();
      el.select();
    }
  }
}
