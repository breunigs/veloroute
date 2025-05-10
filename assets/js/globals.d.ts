import { Socket } from "phoenix";
import { LiveSocket } from "phoenix_live_view";
import { default as maplibregl } from "maplibre-gl";

declare global {
  interface Window {
    state: DOMStringMap;
    pushEvent: (name: string, args: object) => void;
    plausible: (eventName: string, options?: { meta?: any, props?: any }) => void;
    Socket: Socket;
    LiveSocket: LiveSocket;
    mlgl: typeof maplibregl;
    map: maplibregl.Map;
  }

  type ShowMapImageEventDetail = {
    loader_url: string;
    show: boolean;
    url: string;
    zoom: boolean;
    attribution: string;
  }
}
