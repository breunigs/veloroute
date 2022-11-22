import { Socket } from "phoenix";
import { LiveSocket } from "phoenix_live_view";

declare global {
  interface Window {
    state: DOMStringMap;
    pushEvent: (name: string, args: object) => void;
    plausible: (eventName: string, options?: { meta?: any, props?: any }) => void
    Socket: Socket
    LiveSocket: LiveSocket
  }
}
