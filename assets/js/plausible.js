var location = window.location
var document = window.document
var endpoint = '/plausible/event';

function trigger(eventName, options) {
  var payload = {}
  payload.n = eventName
  payload.u = location.href
  payload.d = location.hostname
  payload.r = document.referrer || null
  payload.w = window.innerWidth
  if (options && options.meta) {
    payload.m = JSON.stringify(options.meta)
  }
  if (options && options.props) {
    payload.p = JSON.stringify(options.props)
  }

  var request = new XMLHttpRequest();
  request.open('POST', endpoint, true);
  request.setRequestHeader('Content-Type', 'text/plain');

  request.send(JSON.stringify(payload));

  request.onreadystatechange = function () {
    if (request.readyState == 4) {
      options && options.callback && options.callback()
    }
  }
}

var queue = (window.plausible && window.plausible.q) || []
window.plausible = trigger
for (var i = 0; i < queue.length; i++) {
  trigger.apply(this, queue[i])
}

var lastPage;

function page() {
  if (lastPage === location.pathname) return;
  lastPage = location.pathname
  trigger('pageview')
}

var his = window.history
if (his.pushState) {
  var originalPushState = his['pushState']
  his.pushState = function () {
    originalPushState.apply(this, arguments)
    page();
  }
  window.addEventListener('popstate', page)
}

function handleVisibilityChange() {
  if (!lastPage && document.visibilityState === 'visible') {
    page()
  }
}

if (document.visibilityState === 'prerender') {
  document.addEventListener("visibilitychange", handleVisibilityChange);
} else {
  page()
}

window.addEventListener('beforeprint', () => window.plausible('print'));
