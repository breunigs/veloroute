import type maplibregl from "maplibre-gl"

type IndicatorPos = { lon: number; lat: number; bearing: number | null }

let map: maplibregl.Map
let indicator: maplibregl.Marker | null = null
let zoomedInOnce = false
let flyToSpeed: number
let prevIndicatorPos: IndicatorPos | null = null

const getVideo = () => document.getElementById('videoInner') as HTMLVideoElement | null

const createIndicator = (targetPos: IndicatorPos) => {
  const element = document.getElementById("indicator")
  if (!element) return

  indicator = new window.mlgl.Marker({ element: element })
    .setLngLat(targetPos)
    .setRotation(targetPos.bearing ?? 0)
    .setPitchAlignment("map")
    .setRotationAlignment("map")
    .setSubpixelPositioning(true)

  requestAnimationFrame(() => {
    indicator!.addTo(map)
    requestAnimationFrame(() => element.style.filter = `opacity(1)`)
  })

  prevIndicatorPos = targetPos
}

const zoomInOnce = () => {
  if (zoomedInOnce) return false
  if (map.getZoom() > 13) return false
  if (map.isMoving()) return false
  if (!indicator) return false
  if (!isVideoPlaying()) return false

  zoomedInOnce = true

  map.flyTo({
    center: indicator.getLngLat(),
    zoom: Math.max(map.getZoom(), 14),
    speed: flyToSpeed,
  })

  return true
}

let renderIndicatorAnimation: number | null = null
const renderIndicator = async (timeInMs: number) => {
  const maybePos = await getVideoPosition(timeInMs)
  if (!maybePos) return
  const targetPos = maybePos

  if (!indicator) return createIndicator(targetPos)

  if (targetPos.lat == prevIndicatorPos!.lat &&
    targetPos.lon == prevIndicatorPos!.lon &&
    targetPos.bearing == prevIndicatorPos!.bearing) {
    return
  }

  // zoom in once, i.e. when user just clicks play when first visiting the site
  if (zoomInOnce()) return
  // otherwise show the indicator at whatever zoom level
  ensureIndicatorInViewIdle ||= window.requestIdleCallback(() => {
    ensureIndicatorInView(timeInMs!)
  }, { timeout: 1000 })

  const lngLat = new window.mlgl.LngLat(targetPos.lon, targetPos.lat)
  const dist = indicator.getLngLat().distanceTo(lngLat)
  const animate = dist < 50

  const animationDuration = 150
  const startPos = prevIndicatorPos ?? targetPos
  const bearingDelta = closestEquivalentAngleDelta(startPos, targetPos)

  const startTime = document.timeline.currentTime as number
  const animateIndicator = (timestamp: number) => {
    const ratio = Math.min(1, (timestamp - startTime) / animationDuration)

    const lon = startPos.lon * (1 - ratio) + targetPos.lon * ratio
    const lat = startPos.lat * (1 - ratio) + targetPos.lat * ratio
    const bearing = (startPos.bearing ?? 0) + bearingDelta * ratio;

    // save one call to _update()
    // indicator.setRotation(bearing)
    (indicator as any)._rotation = bearing
    indicator!.setLngLat(new window.mlgl.LngLat(lon, lat))

    prevIndicatorPos = { lat, lon, bearing }

    if (ratio < 1) renderIndicatorAnimation = requestAnimationFrame(animateIndicator)
  }

  if (renderIndicatorAnimation) cancelAnimationFrame(renderIndicatorAnimation)
  if (animate) {
    renderIndicatorAnimation = requestAnimationFrame(animateIndicator)
  } else {
    animateIndicator(startTime + animationDuration)
  }
}

const closestEquivalentAngleDelta = (from: { bearing: number | null }, to: { bearing: number | null }) => {
  if (to.bearing === null) return 0
  return ((((to.bearing - (from.bearing ?? 0)) % 360) + 540) % 360) - 180
}

let ensureIndicatorInViewIdle: number | null = null
const ensureIndicatorInView = async (timeInMs: number) => {
  ensureIndicatorInViewIdle = null
  if (map.isMoving() || !indicator) {
    return
  }

  const lngLat = indicator.getLngLat()
  const padding = 30 // pixels
  const point = map.project(lngLat)

  const canvas = map.getCanvas()
  const width = canvas.clientWidth
  const height = canvas.clientHeight

  const inside = point.x >= padding && point.x <= width - padding
    && point.y >= padding && point.y <= height - padding

  if (inside) return

  const center = map.getCenter()
  const distDiag = center.distanceTo(map.getBounds().getNorthEast())
  const distIndi = center.distanceTo(lngLat)
  const isClose = distIndi <= 1.5 * distDiag
  const indicatorPolyline = await indicatorPolylinePromise

  if (!isVideoPlaying() || !indicatorPolyline) {
    isClose
      ? map.panTo(lngLat)
      : map.flyTo({
        center: lngLat,
        zoom: Math.max(map.getZoom(), 14),
        speed: flyToSpeed,
      })
    return
  }

  const bbox = new window.mlgl.LngLatBounds(lngLat, lngLat)

  const minMs = timeInMs - 4 * 1000
  const maxMs = timeInMs + 15 * 1000

  const minIndex = indicatorIndexBounds(indicatorPolyline, Math.floor(minMs / indicatorPolyline.interval) * 2)
  const maxIndex = indicatorIndexBounds(indicatorPolyline, Math.floor(maxMs / indicatorPolyline.interval) * 2)

  for (let i = minIndex; i <= maxIndex; i += 10) {
    const lon = indicatorPolyline.coords[i]
    const lat = indicatorPolyline.coords[i + 1]
    bbox.extend(new window.mlgl.LngLat(lon, lat))
  }

  map.fitBounds(bbox, {
    linear: isClose,
    maxZoom: map.getZoom(),
    speed: flyToSpeed,
  })
}

const isVideoPlaying = () => {
  const video = getVideo()
  return !!video && !video.paused && !video.ended
}

let indicatorPolylinePromise: Promise<{ coords: Float32Array; interval: number; eps: number } | null> = Promise.resolve(null)

const updateIndicatorPolyline = (data: { polyline: string; precision: number; interval: number } | null) => {
  if (!data) return

  indicatorPolylinePromise = new Promise((resolve) => {
    setTimeout(() => {
      console.debug("updating video polyline")
      resolve({
        coords: polyline2coords(data.polyline, data.precision),
        interval: data.interval,
        eps: 10 ** (-data.precision),
      })
    }, 0)
  })
}

const toRad = (degrees: number) => degrees * Math.PI / 180

const toDeg = (radians: number) => radians * 180 / Math.PI

const calcBearing = (fromLon: number, fromLat: number, toLon: number, toLat: number) => {
  const φ1 = toRad(fromLat)
  const φ2 = toRad(toLat)
  const Δλ = toRad(toLon - fromLon)

  const y = Math.sin(Δλ) * Math.cos(φ2)
  const x =
    Math.cos(φ1) * Math.sin(φ2) -
    Math.sin(φ1) * Math.cos(φ2) * Math.cos(Δλ)

  const bearing = Math.atan2(y, x)
  return toDeg(bearing)
}

const getVideoPosition = async (timeInMs: number) => {
  const indicatorPolyline = await indicatorPolylinePromise
  if (!indicatorPolyline) return

  const index = indicatorIndexBounds(
    indicatorPolyline,
    Math.floor(timeInMs / indicatorPolyline.interval) * 2
  )
  const lon1 = indicatorPolyline.coords[index]
  const lat1 = indicatorPolyline.coords[index + 1]

  // Look 100ms in the future to calculate a bearing that is not too affected by
  // precision/rounding errors.
  let next = indicatorIndexBounds(
    indicatorPolyline,
    index + Math.round(100 / indicatorPolyline.interval) * 2
  )
  let lon2 = indicatorPolyline.coords[next]
  let lat2 = indicatorPolyline.coords[next + 1]

  // If both points are close to each other, look 1s further
  let close = veryClose(indicatorPolyline, lon1, lat1, lon2, lat2)
  if (close) {
    next += Math.round(1000 / indicatorPolyline.interval) * 2
    next = indicatorIndexBounds(
      indicatorPolyline,
      next
    )
    lon2 = indicatorPolyline.coords[next]
    lat2 = indicatorPolyline.coords[next + 1]
    close = veryClose(indicatorPolyline, lon1, lat1, lon2, lat2)
  }

  // If they are still close, we give up and re-use the previous position
  const bearing = close ? null : calcBearing(lon1, lat1, lon2, lat2)

  return {
    lon: lon1,
    lat: lat1,
    bearing: bearing
  }
}

const indicatorIndexBounds = (indicatorPolyline: { coords: Float32Array }, index: number) => {
  if (index <= 0) return 0
  return Math.min(index, indicatorPolyline.coords.length - 2)
}

// veryClose returns true when the two coordinates only differ in their least
// significant digit, determined from the indicatorPolyline precision.
const veryClose = (indicatorPolyline: { eps: number }, lon1: number, lat1: number, lon2: number, lat2: number) => {
  const close = indicatorPolyline.eps * 10
  return Math.abs(lon1 - lon2) < close && Math.abs(lat1 - lat2) < close
}

// algorithm specification: https://developers.google.com/maps/documentation/utilities/polylinealgorithm
const polyline2coords = (str: string, precision: number) => {
  const factor = 10 ** (precision || 6)

  let index = 0
  let coordIndex = 0
  let lat = 0
  let lon = 0
  const len = str.length
  let coordinates = new Float32Array(Math.floor(len / 2) * 2)

  let byte, shift, val
  while (index < len) {
    shift = val = 0

    do {
      byte = str.charCodeAt(index++) - 63
      val |= (byte & 0x1f) << shift
      shift += 5
    } while (byte >= 0x20)

    lat += ((val & 1) ? ~(val >> 1) : (val >> 1))

    shift = val = 0

    do {
      byte = str.charCodeAt(index++) - 63
      val |= (byte & 0x1f) << shift
      shift += 5
    } while (byte >= 0x20)

    lon += ((val & 1) ? ~(val >> 1) : (val >> 1))

    coordinates[coordIndex++] = lon / factor
    coordinates[coordIndex++] = lat / factor
  }

  // remove any over allocated entries
  return coordinates.subarray(0, coordIndex)
}

export const setupIndicator = (mapInstance: maplibregl.Map, flyToSpeedInput: number) => {
  map = mapInstance
  flyToSpeed = flyToSpeedInput

  window.addEventListener("phx:video_meta", (e: any) => {
    updateIndicatorPolyline(e.detail.polyline)
  })

  window.addEventListener("video:timeupdate", (e: any) => {
    if (typeof e.detail.timeInMs !== "number") return
    renderIndicator(e.detail.timeInMs)
  })
}
