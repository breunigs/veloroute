import { Socket } from "phoenix";
import { LiveSocket } from "phoenix_live_view";
import { default as maplibregl } from "maplibre-gl";

declare global {
  const Hls: typeof import("hls.js").default;

  interface Window {
    state: DOMStringMap;
    pushEvent: (name: string, args: object) => void;
    plausible: (eventName: string, options?: { meta?: any, props?: any }) => void;
    Socket: Socket;
    LiveSocket: LiveSocket;
    mlgl: typeof maplibregl;
    map: maplibregl.Map;
    hls: import("hls.js").default;
  }

  type ShowMapImageEventDetail = {
    loader_url: string;
    show: boolean;
    url: string;
    zoom: boolean;
    attribution: string;
  }
}
