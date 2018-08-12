export default class {
  constructor(map, mlyViewer) {
    this.map = map;
    this.mlyViewer = mlyViewer;

    this.main = document.getElementById("main");
    this.side = document.getElementById("side");

    const swapBtn = document.getElementById("swap");
    swapBtn.addEventListener("click", this._swap.bind(this));
  }

  _swap() {
    // avoid grabbing textNodes
    const ch1 = main.querySelector('div');
    const ch2 = side.querySelector('div');
    this.main.appendChild(ch2);
    this.side.appendChild(ch1);
    invalidate();
  }

  async _invalidate() {
    if (this.mlyViewer.isNavigable) this.mlyViewer.resize();
    this.map.resize();
  }
}
