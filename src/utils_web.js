function isMobileView(body) {
  body = body || document.getElementsByTagName('body')[0];
  return body.clientWidth <= 700;
}

export { isMobileView };
