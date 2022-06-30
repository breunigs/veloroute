import { IControl, Map as MapboxMap } from "mapbox-gl";

declare global {
  interface Window {
    state: DOMStringMap;
  }
}

type toggableLayer =
  {
    type: string,
    title: string,
    line?: string[],
    icon?: string[],
    fill?: string[],
  }

export class MapboxStyleSwitcherControl implements IControl {
  private layerConfig: toggableLayer[] = [
    {
      type: "articles",
      title: "Artikel",
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
    }
  ]

  private layerAbove = {
    line: "detour-line",
    icon: "article-areas title"
  }

  private visibleMinZooms: { [id: string]: number; } = {};
  private hiddenMinZoom = 11;
  private hiddenOpacityRule = ["interpolate", ["linear"],
    ["zoom"], this.hiddenMinZoom, 0, 20, 1
  ];

  private container = document.createElement("div");
  private map?: MapboxMap;
  private checkboxGroup = document.createElement("div");
  private iconButton = document.createElement("button");
  private typesOnOverride: string[] | undefined;
  private visibleTypes: string[] | undefined;

  public getDefaultPosition(): string {
    const defaultPosition = "bottom-left";
    return defaultPosition;
  }

  public onAdd(map: MapboxMap): HTMLElement {
    this.map = map;

    this.container.classList.add("mapboxgl-ctrl", "mapboxgl-ctrl-group");
    this.container.setAttribute("id", "layerSwitcher");

    this.checkboxGroup.classList.add("mapboxgl-ctrl-group")
    this.checkboxGroup.addEventListener('click', event => {
      if (!event.target) return;
      const type = (event.target as HTMLElement).dataset.type;
      if (!type) return;

      this.toggleLayer(type);
    });


    this.iconButton.classList.add("mapboxgl-ctrl-icon", "mapboxgl-style-switcher");

    this.container.appendChild(this.iconButton);
    this.container.appendChild(this.checkboxGroup);
    return this.container;
  }

  public onRemove(): void {
    throw "not implemented";
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

  private stateTypes(): string[] {
    return window.state.visibleTypes!.split(",");
  }

  private currentTypes(): string[] {
    return this.visibleTypes || this.stateTypes();
  }

  private maybeResetVisibleTypes(): void {
    if (this.typesOnOverride?.join(",") === window.state.visibleTypes!) return;
    this.typesOnOverride = undefined;
    this.visibleTypes = undefined;
  }

  public refresh(): void {
    this.maybeResetVisibleTypes();
    const visible = this.currentTypes();

    let html = "";
    for (const layer of this.layerConfig) {
      const isVisible = visible.indexOf(layer.type) >= 0;
      if (layer.icon) this.updateMapPrimitive(layer, "icon", isVisible);
      if (layer.line) this.updateMapPrimitive(layer, "line", isVisible);
      if (layer.fill) this.updateMapPrimitive(layer, "fill", isVisible);
      html += this.renderButton(layer, isVisible)
    }
    this.checkboxGroup.innerHTML = html;
  }

  private renderButton(layer: toggableLayer, visible: boolean): string {
    return `<button data-type="${layer.type}" class="${visible ? "active" : ""}">${layer.title}</button>`
  }

  private minZoomForLayer(layerName: string, minZoom: number): void {
    if (!this.visibleMinZooms[layerName]) {
      const layer = this.map!.getLayer(layerName) as mapboxgl.Layer;
      this.visibleMinZooms[layerName] = layer.minzoom || 1;
    }

    minZoom = Math.max(minZoom, this.visibleMinZooms[layerName]);
    this.map!.setLayerZoomRange(layerName, minZoom, 24);
  }

  private updateMapPrimitive(layer: toggableLayer, drawPrimitive: string, isVisible: boolean): void {
    const layerNames = layer[drawPrimitive];
    const opacity = isVisible ? 1 : this.hiddenOpacityRule;
    const minZoom = isVisible ? 1 : this.hiddenMinZoom;

    layerNames.forEach(layerName => {
      this.minZoomForLayer(layerName, minZoom)

      const visible = isVisible || drawPrimitive == 'line' ? 'visible' : 'none';
      this.map!.setLayoutProperty(layerName, "visibility", visible, {
        validate: false
      });

      this.map!.setPaintProperty(layerName, `${drawPrimitive}-opacity`, opacity, {
        validate: false
      });

      if (isVisible && drawPrimitive == 'line' && layerName.indexOf('line') >= 0) {
        // console.log("moving", layerName, "above", layerAbove[drawPrimitive])
        this.map!.moveLayer(layerName, this.layerAbove[drawPrimitive]);
      }
    });
  }
}
