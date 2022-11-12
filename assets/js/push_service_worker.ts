/// <reference lib="webworker" />
export default null
declare var self: ServiceWorkerGlobalScope;

self.addEventListener("push", (event) => {
  if (!event.data) {
    console.error("received invalid notification from server", event)
    return
  }

  const parsed = event.data.json()
  let url = new URL(parsed.url)
  url.protocol = self.location.protocol
  url.host = self.location.host
  url.port = self.location.port

  let noti = self.registration.showNotification(parsed.title, {
    body: parsed.body + "\n" + url.host + url.pathname,
    tag: "veloroute-notification",
    icon: "/images/favicon.svg",
    data: { url: url.toString() },
    silent: true,
  })
  if (parsed.report) noti = noti.then(() => reportToParent(parsed.report))

  event.waitUntil(noti)
});

self.addEventListener("notificationclick", (event) => {
  event.notification.close();
  if (!event.notification.data.url) return;

  const parsed = new URL(event.notification.data.url)

  event.waitUntil(self.clients.matchAll({ type: 'window', includeUncontrolled: true }).then((tabs) => {
    const found = tabs.some((tab) => {
      const have = new URL(tab.url)
      if (have.host === parsed.host && have.pathname === parsed.pathname) return (tab.focus(), true)
      return false
    });
    if (found) return

    self.clients.openWindow(event.notification.data.url).then(client => client?.focus())
  }));
});

function reportToParent(payload: object) {
  self.clients.matchAll({ includeUncontrolled: true }).then((clients) => {
    for (let client of clients) {
      client.postMessage(payload)
    }
  })
}
