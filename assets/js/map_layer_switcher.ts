import { IControl, Map as MapboxMap, Layer } from "mapbox-gl";

declare global {
  interface Window {
    state: DOMStringMap;
    pushEvent: (name: string, args: object) => void;
  }
}

type toggableLayer =
  {
    [index: string]: any;

    type: string,
    title: string,
    line?: string[],
    icon?: string[],
    fill?: string[],
  }

type mapStyle =
  {
    title: string,
    type: string,
  }

export class MapboxStyleSwitcherControl implements IControl {
  private layerConfig: toggableLayer[] = [
    {
      type: "articles",
      title: "Artikel",
      outline: ["article-areas bg outline", "article-areas bg outline dash"],
      fill: ['article-areas bg'],
      icon: ['article-areas title']
    },
    {
      type: "alltag",
      title: "Alltagsrouten",
      line: ['vr-line-off-p1', 'vr-line-off-m1', 'vr-line-off-none'],
      icon: ['vr-oneway', 'vr-sign'],
    }, {
      type: "freizeit",
      title: "Freizeitrouten",
      line: ['fr-line'],
      icon: ['fr-oneway', 'fr-sign', 'fr-warning-icons']
    }, {
      type: "rsw",
      title: "Radschnellwege",
      line: ['rsw-line'],
      icon: ['rsw-oneway', 'rsw-sign'],
    }
  ]

  private styleConfig: mapStyle[] = []

  private layerAbove = {
    line: "detour-line",
    icon: "article-areas title"
  }

  private visibleMinZooms: { [id: string]: number; } = {};
  private hiddenMinZoom = 11;
  private hiddenOpacityRule = ["interpolate", ["linear"],
    ["zoom"], this.hiddenMinZoom, 0, 20, 1
  ];

  private container = document.createElement("div")
  private map?: MapboxMap;
  private checkboxGroup = document.createElement("div")
  private iconButton = document.createElement("button")
  private typesOnOverride = ["articles", "alltag"];
  private visibleTypes: string[] | undefined;

  constructor(styles: string) {
    styles.split("\n").forEach(s => {
      let [type, title] = s.split(" ", 2);
      this.styleConfig.push({ type: type, title: title })
    })
  }

  public getDefaultPosition(): string {
    const defaultPosition = "bottom-left";
    return defaultPosition;
  }

  public onAdd(map: MapboxMap): HTMLElement {
    this.map = map;

    this.container.classList.add("mapboxgl-ctrl", "mapboxgl-ctrl-group")
    this.container.setAttribute("id", "layerSwitcher")
    this.container.addEventListener("mouseenter", () => this.refresh())

    this.checkboxGroup.classList.add("mapboxgl-ctrl-group")
    this.checkboxGroup.addEventListener('click', event => {
      if (!event.target) return;
      const target = (event.target as HTMLElement);
      const type = target.dataset.type;
      if (!type) return;

      if (target.classList.contains("layer")) {
        this.toggleLayer(type);
      } else {
        this.switchStyle(type)
      }
    });

    this.iconButton.classList.add("mapboxgl-ctrl-icon", "mapboxgl-style-switcher");

    this.container.appendChild(this.iconButton);
    this.container.appendChild(this.checkboxGroup);
    return this.container;
  }

  public onRemove(): void {
    throw "not implemented";
  }

  public refreshIfChanged(): void {
    // TODO: this ignores any change in style. There are currently no
    // server-side events to switch the style.
    if (this.typesOnOverride.join(",") === this.stateTypes().join(",")) return;
    this.visibleTypes = this.stateTypes();
    this.refresh();
  }

  private toggleLayer(value: string): void {
    this.typesOnOverride = this.stateTypes();
    let layers = this.currentTypes();

    var index = layers.findIndex(val => val === value);
    if (index === -1) layers.push(value);
    else layers.splice(index, 1);

    this.visibleTypes = layers;
    this.refresh();
  }

  private switchStyle(value: string): void {
    window.state.mapboxStyleId = value;
    this.map?.once("style.load", () => this.refresh())
    this.map?.setStyle('mapbox://styles/' + value);
    window.pushEvent("map-style-switch", {
      style: value,
    })
  }

  private stateTypes(): string[] {
    return window.state.visibleTypes!.split(",");
  }

  private currentTypes(): string[] {
    return this.visibleTypes || this.stateTypes();
  }

  private refresh(): void {
    const visible = this.currentTypes();
    let html = "";
    for (const layer of this.layerConfig) {
      const isVisible = visible.indexOf(layer.type) >= 0;
      this.updateMapPrimitive(layer.icon, "icon", isVisible);
      this.updateMapPrimitive(layer.outline, "line", isVisible);
      this.updateMapPrimitive(layer.line, "line", isVisible, true);
      this.updateMapPrimitive(layer.fill, "fill", isVisible);
      html += this.renderButton(layer, "layer", isVisible)
    }
    for (const style of this.styleConfig) {
      html += this.renderButton(style, "style", style.type == window.state.mapboxStyleId)
    }
    if (this.checkboxGroup.innerHTML == html) return;
    this.checkboxGroup.innerHTML = html;
  }

  private renderButton(layer: toggableLayer | mapStyle, type: string, visible: boolean): string {
    return `<button data-type="${layer.type}" class="${visible ? "active" : ""} ${type}">${layer.title}</button>`
  }

  private minZoomForLayer(layerName: string, minZoom: number): void {
    if (!this.visibleMinZooms[layerName]) {
      const layer = this.map!.getLayer(layerName) as Layer;
      this.visibleMinZooms[layerName] = layer.minzoom || 1;
    }

    minZoom = Math.max(minZoom, this.visibleMinZooms[layerName]);
    this.map!.setLayerZoomRange(layerName, minZoom, 24);
  }

  private updateMapPrimitive(layerNames: string[] | undefined, drawPrimitive: string, isVisible: boolean, showOnHighZoom: boolean = false): void {
    if (!layerNames) return;

    const opacity = isVisible ? 1 : this.hiddenOpacityRule;
    const minZoom = isVisible ? 1 : this.hiddenMinZoom;

    layerNames.forEach(layerName => {
      this.minZoomForLayer(layerName, minZoom)

      const visible = isVisible || showOnHighZoom ? 'visible' : 'none';
      // @ts-ignore wrong signature in 3rd party types
      this.map?.setLayoutProperty(layerName, "visibility", visible, {
        validate: false
      });

      // @ts-ignore wrong signature in 3rd party types
      this.map?.setPaintProperty(layerName, `${drawPrimitive}-opacity`, opacity, {
        validate: false
      });

      if (isVisible && drawPrimitive == 'line' && layerName.indexOf('line') >= 0) {
        // console.log("moving", layerName, "above", layerAbove[drawPrimitive])
        this.map?.moveLayer(layerName, this.layerAbove[drawPrimitive]);
      }
    });
  }
}
