var spritezero = require('@mapbox/spritezero');
var fs = require('fs');
var glob = require('glob');
var path = require('path');

[1, 2].forEach(function (pxRatio) {
  var svgs = glob.sync('/source/**/*.svg')
    .map(function (f) {
      return {
        svg: fs.readFileSync(f),
        id: path.basename(f).replace('.svg', '')
      };
    });

  var infix = pxRatio == 1 ? '' : '@' + pxRatio + 'x';
  var pngPath = '/target/sprite' + infix + '.png';
  var jsonPath = '/target/sprite' + infix + '.json';

  spritezero.generateLayoutUnique({
    imgs: svgs,
    pixelRatio: pxRatio,
    format: true
  }, function (err, dataLayout, imageLayout) {
    if (err) return;
    spritezero.generateOptimizedImage(imageLayout, {}, function (err, image) {
      if (err) return;
      fs.writeFileSync(pngPath, image);
    });
    fs.writeFileSync(jsonPath, JSON.stringify(dataLayout));
  });
});
