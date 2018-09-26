// because moving webpack config through babel triggers version hell due to some
// other plugin loading only babel 6.x

function toFileName(string) {
  string = string.toLowerCase();
  string = string.replace(/ä/g, 'ae');
  string = string.replace(/ö/g, 'oe');
  string = string.replace(/ü/g, 'ue');
  string = string.replace(/ß/g, 'ss');
  return string.replace(/[^a-z0-9]+/ig, '-');
}

function toQualityName(string) {
  return "quality/" + string;
}

module.exports.toFileName = toFileName;
module.exports.toQualityName = toQualityName;
