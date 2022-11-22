export { };

type payload =
  {
    n: string,
    u: string,
    d: string,
    r: string | null,
    w: number,
    m?: string,
    p?: string,
  }


window.plausible = (eventName, options) => {
  let payload: payload = {
    n: eventName,
    u: window.location.href,
    d: window.location.hostname,
    r: window.document.referrer || null,
    w: window.innerWidth,
  }
  if (options?.meta) payload.m = JSON.stringify(options.meta)
  if (options?.props) payload.p = JSON.stringify(options.props)

  fetch('/plausible/event', {
    method: 'POST',
    headers: { 'Content-Type': 'text/plain' },
    body: JSON.stringify(payload),
    // @ts-ignore experimental feature, cmp. https://web.dev/priority-hints/#the-fetchpriority-attribute
    priority: 'low',
  })
}

let lastPage: string

function page() {
  if (lastPage === window.location.pathname) return;
  lastPage = window.location.pathname
  window.plausible('pageview')
}

if (window.history.pushState) {
  let originalPushState = window.history.pushState
  window.history.pushState = function () {
    // @ts-ignore no idea how to make strict typescript happy here
    originalPushState.apply(this, arguments)
    page()
  }
  window.addEventListener('popstate', page)
}

page()

window.addEventListener('beforeprint', () => window.plausible('print'))
