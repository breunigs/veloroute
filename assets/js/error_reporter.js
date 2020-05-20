window.onerror = function(msg, url, lineNo, columnNo, error) {
  const xhr = new XMLHttpRequest();
  xhr.open('POST', '/js_errors', true);
  let body = "";
  body += "msg: " + msg + "\n"
  body += "url: " + url + "\n"
  body += "lineNo: " + lineNo + "\n"
  body += "columnNo: " + columnNo + "\n"
  if(error !== undefined) {
    body += "error: " + error + "\n"
    body += "stack: " + error.stack + "\n"
  }

  xhr.send(body);
}
