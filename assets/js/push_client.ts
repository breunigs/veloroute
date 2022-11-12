type status =
  {
    supported: boolean,
    permission: NotificationPermission,
    subscription: PushSubscription | null,
  }

type HTMLElementWithPush = HTMLElement & {
  pushEvent: (name: string, args?: object) => void;
}


const supported = ("Notification" in window) && ("serviceWorker" in navigator) && ('PushManager' in window)
let element: HTMLElementWithPush;

function error(message: Error) {
  console.error(message)
  element.pushEvent("error", message)
  window.plausible('push-error', {
    props: {
      message: message
    }
  })
}

async function getStatus() {
  let status: status = {
    supported: supported,
    permission: "denied",
    subscription: null,
  }
  if (!supported) return status;

  status.permission = Notification.permission;
  status.subscription = await getServiceworkerSubscription()

  return status
}

function sendStatus() {
  console.log("push", "sending status")
  return getStatus()
    .then(status => {
      console.log("push", "sending status", status)
      element.pushEvent("status", status)
    })
}

function subscribe(publicKey: string) {
  console.log("push", "subscribing using public key", publicKey)

  if (!element.dataset.serviceWorkerUrl) return Promise.reject(new Error("service worker URL not configured"))

  return navigator.serviceWorker.register(element.dataset.serviceWorkerUrl)
    .then(reg => {
      if (!reg) throw new Error("failed to register service worker")

      const serviceWorker = reg.installing || reg.waiting || reg.active;
      if (!serviceWorker) throw new Error("failed to find service worker from registration")

      if (serviceWorker.state === "activated") return reg

      return new Promise((resolve, _reject) => {
        serviceWorker.addEventListener("statechange", (e) => {
          if ((e.target as ServiceWorker).state === "activated") return resolve(reg)
        })
      })
    })
    .then(registration => {
      return (registration as ServiceWorkerRegistration).pushManager.subscribe({
        userVisibleOnly: true,
        applicationServerKey: urlBase64ToUint8Array(publicKey)
      }).catch(e => {
        if (e.name === "NotAllowedError") {
          // user declined permission, which is a known scenario and not an error
          return true
        }
        throw e
      })
    })
    .then(res => {
      console.log("push", "subscription yielded", res)
      if (!res) { throw new Error("failed to register new push worker") }
      return true
    })
}

function test() {
  navigator.serviceWorker.addEventListener('message', (e) => {
    element.pushEvent("test-notification-reply", e.data)
  }, { once: true })

  console.log("push", "sending test notifiction")
  element.pushEvent("test-notification")
}

function enroll(evt: CustomEvent) {
  subscribe(evt.detail.public_key)
    .then(sendStatus)
    .then(test)
    .catch(error)
}

function unsubscribe() {
  console.log("push", "unsubscribing")
  getServiceworkerSubscription()
    .then(subscription => {
      if (subscription) return subscription.unsubscribe()
      return null
    })
    .then(getServiceWorkerRegistration)
    .then(registration => {
      if (registration) return registration.unregister()
      return null
    })
    .catch(error)
}

function getServiceWorkerRegistration() {
  if (!element.dataset.serviceWorkerUrl) throw new Error("service worker URL not configured")
  return navigator.serviceWorker.getRegistration(element.dataset.serviceWorkerUrl).then(registration => {
    if (!registration) return null
    return registration
  });
}


function getServiceworkerSubscription() {
  return getServiceWorkerRegistration()
    .then(registration => {
      if (!registration) return null;
      return registration.pushManager.getSubscription()
    })
}

function pushInit(el: HTMLElementWithPush) {
  console.log("push", "init")
  element = el;
  element.addEventListener("push:enroll", enroll as EventListener)
  element.addEventListener("push:test", test)
  element.addEventListener("push:status", sendStatus)
  element.addEventListener("push:unsubscribe", unsubscribe)
  sendStatus().catch(error)
}
window.pushInit = pushInit

function urlBase64ToUint8Array(base64String: string) {
  const padding = '='.repeat((4 - base64String.length % 4) % 4);
  const base64 = (base64String + padding)
    .replace(/\-/g, '+')
    .replace(/_/g, '/')
    ;
  const rawData = window.atob(base64);
  return Uint8Array.from([...rawData].map((char) => char.charCodeAt(0)));
}



