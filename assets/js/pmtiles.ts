import { Protocol } from "pmtiles";
const protocol = new Protocol({ metadata: true });
mlgl.addProtocol('pmtiles', protocol.tile);
