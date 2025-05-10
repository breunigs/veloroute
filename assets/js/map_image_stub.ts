window.addEventListener("phx:show_map_image", lazyLoad);

function lazyLoad(origEvent: Event) {
  const event = origEvent as CustomEvent<ShowMapImageEventDetail>;
  if (!event.detail.loader_url) return
  window.removeEventListener("phx:show_map_image", lazyLoad);
  console.log(event)

  window.dispatchEvent(new CustomEvent("js:load", {
    detail: {
      url: event.detail.loader_url,
      callback: () => {
        window.dispatchEvent(event)
      }
    }
  }))
}
