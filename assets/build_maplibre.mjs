import { mkdirSync, readFileSync, rmSync, writeFileSync } from 'fs';

// We only ever load MVT tiles, but maplibre statically pulls in @maplibre/mlt
// to decode MLT ones, which is ~65kb of its bundle. Stubbing the one class
// that reaches the decoder leaves it unreferenced, so esbuild drops all of it.
// Done on a copy of the prebuilt dist rather than by bundling maplibre from
// source, because esbuild's own output is ~17kb gzip larger than theirs.
const SRC = 'node_modules/maplibre-gl/dist';
const DEST = 'vendor/maplibre';
const PATCHED = 'maplibre-gl-shared.mjs';
const FILES = ['maplibre-gl.mjs', PATCHED, 'maplibre-gl-worker.mjs'];

// matches: pT=class{constructor(e){this.layers={};let t=cT(new Uint8Array(e));
//          this.layers=t.reduce((e,t)=>({...e,[t.name]:new fT(t)}),{})}}
const MLT_TILE =
  /(\w+)=class\{constructor\((\w+)\)\{this\.layers=\{\};let (\w+)=\w+\(new Uint8Array\(\2\)\);this\.layers=\3\.reduce\(\(\w+,\w+\)=>\(\{\.\.\.\w+,\[\w+\.name\]:new \w+\(\w+\)\}\),\{\}\)\}\}/g;
const STUB = '$1=class{constructor(){throw Error("MLT tiles are not supported")}}';

const { version } = JSON.parse(readFileSync('node_modules/maplibre-gl/package.json', 'utf-8'));

// leave nothing behind when the patch no longer applies: the next esbuild run
// would otherwise silently bundle the copy made from an older maplibre
rmSync(DEST, { recursive: true, force: true });

const patch = (code) => {
  const hits = code.match(MLT_TILE)?.length ?? 0;

  if (hits !== 1) {
    throw new Error(
      `Found ${hits} MLT tile classes in ${SRC}/${PATCHED}, expected exactly 1.\n` +
        `maplibre-gl ${version} must have changed how it decodes tiles. Re-derive the\n` +
        'pattern in assets/build_maplibre.mjs against the new dist, or drop that file,\n' +
        'its npm script and the --alias in the esbuild maplibre profile to go back to\n' +
        'the unpatched package.',
    );
  }

  return code.replace(MLT_TILE, STUB);
};

const files = FILES.map((file) => {
  const code = readFileSync(`${SRC}/${file}`, 'utf-8');
  return [file, file === PATCHED ? patch(code) : code];
});

mkdirSync(DEST, { recursive: true });
files.forEach(([file, code]) => writeFileSync(`${DEST}/${file}`, code));

console.log(`maplibre-gl ${version} without MLT written to ${DEST}`);
