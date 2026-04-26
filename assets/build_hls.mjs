import { build } from 'esbuild';
import { readFileSync } from 'fs';

const { version } = JSON.parse(readFileSync('node_modules/hls.js/package.json', 'utf-8'));

await build({
  entryPoints: ['node_modules/hls.js/src/hls.ts'],
  bundle: true,
  minify: true,
  sourcemap: true,
  format: 'esm',
  outfile: 'vendor/hls.light-iframes.min.js',
  define: {
    __USE_SUBTITLES__: 'false',
    __USE_ALT_AUDIO__: 'false',
    __USE_EME_DRM__: 'false',
    __USE_CMCD__: 'false',
    __USE_VARIABLE_SUBSTITUTION__: 'false',
    __USE_INTERSTITIALS__: 'false',
    __USE_IFRAMES__: 'true',
    __USE_M2TS_ADVANCED_CODECS__: 'false',
    __USE_MEDIA_CAPABILITIES__: 'true',
    __USE_CONTENT_STEERING__: 'false',
    __VERSION__: JSON.stringify(version),
  },
});

console.log('hls.light+iframes build complete');
