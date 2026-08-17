#!/usr/bin/env node
// Validates MapLibre GL style expressions using the style-spec expression compiler.
// Called from Elixir tests via System.cmd.
//
// Usage: node validate_style.mjs <path-to-style.json>
// Exit 0 = valid, Exit 1 = errors found

import { createPropertyExpression, latest as spec } from '@maplibre/maplibre-gl-style-spec';
import { readFileSync } from 'fs';

const stylePath = process.argv[2];
if (!stylePath) {
  console.error("Usage: node validate_style.mjs <style.json>");
  process.exit(2);
}

const style = JSON.parse(readFileSync(stylePath, 'utf8'));
let errors = 0;

const paintSpecs = {
  line: spec.paint_line,
  fill: spec.paint_fill,
  symbol: spec.paint_symbol,
  circle: spec.paint_circle,
  background: spec.paint_background,
  raster: spec.paint_raster,
  heatmap: spec.paint_heatmap,
  hillshade: spec.paint_hillshade,
};

for (const layer of style.layers) {
  const paintSpec = paintSpecs[layer.type];
  if (!paintSpec || !layer.paint) continue;

  for (const [prop, val] of Object.entries(layer.paint)) {
    if (typeof val !== 'object' || val === null) continue;
    // Skip literal arrays (dasharray [2, 1], translate [0, 5], etc.)
    // These are not expressions — they don't start with a string operator
    if (Array.isArray(val) && typeof val[0] === 'number') continue;
    // Skip old-style stop-function objects ({stops: [...]})
    if (!Array.isArray(val)) continue;

    const propSpec = paintSpec[prop];
    if (!propSpec) continue;

    const result = createPropertyExpression(val, propSpec);
    if (result.result === 'error') {
      for (const err of result.value) {
        console.error(`${layer.id} -> ${prop}: ${err.message}`);
      }
      errors++;
    }
  }
}

if (errors > 0) {
  process.exit(1);
}
