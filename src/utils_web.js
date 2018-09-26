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

function isMobileView(body) {
  body = body || document.getElementsByTagName('body')[0];
  return body.clientWidth <= 700;
}

export { toFileName, toQualityName, isMobileView };
