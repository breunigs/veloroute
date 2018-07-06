import { map } from "./raster";
import { zIndexBase } from "./config";

const quality = function(map, index) {
  const pre = document.querySelector("pre#tags");
  const pane = map.createPane("quality");
  pane.style.zIndex = index;

  // horrible hack to allow to "click through" to the route layers
  L.DomEvent.on(pane, "click", function(e) {
    pane.style.display = "none";

    var ev = new MouseEvent(e.type, e);
    target = document.elementFromPoint(e.clientX, e.clientY);

    if (target && target !== pane) {
      stopped = !target.dispatchEvent(ev);
      if (stopped || ev._stopped) {
        L.DomEvent.stop(e);
      }
    }

    pane.style.display = "block";
  });

  const colors = [
    "#457FEE", // missing tags
    "#0B7A28", // good
    "#E5D22B", // avg
    "#AA001B" // bad
  ];

  function pathOnStreet(kind) {
    let isOnStreet =
      kind == "?" || // i.e. we don't know what kind of cycleway it is
      kind == "crossing" ||
      kind == "lane" ||
      kind == "no" ||
      kind == "none" ||
      kind == "opposite" ||
      kind == "opposite_lane" ||
      kind == "share_busway" ||
      kind == "shared_lane" ||
      kind == "sidepath" ||
      kind == "street";
    return isOnStreet;
  }

  function determineKindOfCycleway(tags) {
    let prefix = "";
    let kind = "?";
    // for streets with both cycleway:right and cycleway:left we should probably build an average
    if (tags.cycleway_right && tags.cycleway_right != "use_sidepath") {
      kind = tags.cycleway_right;
      prefix = "cycleway_right_";
    } else if (tags.cycleway_left && tags.cycleway_left != "use_sidepath") {
      kind = tags.cycleway_left;
      prefix = "cycleway_left_";
    } else if (tags.cycleway_both) {
      kind = tags.cycleway_both;
      // TODO: we should return an array of possible tags instead of simply guessing
      prefix = "cycleway_right_";
    } else if (tags.cycleway && tags.cycleway != "use_sidepath") {
      kind = tags.cycleway;
      prefix = "cycleway_"; // i.e. no additional prefix to check
    }
    return [kind, prefix];
  }

  function pathNotSegregatedFromCars(tags) {
    let [kind, prefix] = determineKindOfCycleway(tags);
    let sharedWithCar =
      kind == "?" || // i.e. we don't know what kind of cycleway it is
      kind == "no" ||
      kind == "none" ||
      kind == "opposite" ||
      kind == "shared_lane" ||
      kind == "sidepath" ||
      kind == "street";
    return sharedWithCar;
  }

  function getValue(tags, tag) {
    let [kind, prefix] = determineKindOfCycleway(tags);

    let value =
      tags[prefix + tag] ||
      tags["cycleway_both_" + tag] ||
      tags["cycleway_" + tag];
    // allow fallback for certain tag/value combinations
    let isCombinedFootCycleWay = kind == "track" && tags.highway == "footway";
    if (isCombinedFootCycleWay || pathOnStreet(kind) || tag == "lit")
      value = value || tags[tag];
    return value;
  }

  function gradeTags(tags, verbose) {
    let min = 0;

    let width = getValue(tags, "width");
    if (width && width < 1.5) {
      if (verbose) console.debug("width too small, demoting");
      min = Math.max(min, 2);
    }
    if (getValue(tags, "lit") == "no") {
      if (verbose) console.debug("not lit, demoting");
      min = Math.max(min, 2);
    }
    if (tags.maxspeed > 30 && pathNotSegregatedFromCars(tags)) {
      if (verbose) console.debug("maxspeed > 30 and have to cycle on street, demoting");
      min = Math.max(min, 3);
    }


    switch (getValue(tags, "smoothness")) {
      case "excellent":
        return Math.max(min, 1);
      case "good":
        return Math.max(min, 2);
      case "intermediate":
        return Math.max(min, 3);
      default:
        if (verbose) console.debug("no smoothness, guessing from surface tag");
        let surface = getValue(tags, "surface");
        switch (surface) {
          case "asphalt":
          case "concrete":
          case "metal":
            return Math.max(min, 1);
          case "paving_stones":
            return Math.max(min, 2);
          case "fine_gravel":
          case "cobblestone":
          case "sett":
          case "gravel":
            return Math.max(min, 3);
          default:
            if (verbose) console.debug(`unknown surface: '${surface}'`);
            return 0;
        }
    }
  }

  function toColor(grade) {
    return colors[Math.round(grade)];
  }

  function showTags(tags) {
    pre.innerText = JSON.stringify(tags, null, 2);
    pre.innerText += `\n(grade: ${gradeTags(tags, true)})`;
  }

  fetch("routes/geo/quality.json")
    .then(response => response.json())
    .then(jsonResponse => {
      Object.entries(jsonResponse).forEach(([_index, line]) => {
        const geom = line.geometry.map(([lon, lat]) => [lat, lon]);
        const grade = gradeTags(line.tags);
        L.polyline(geom, { color: toColor(grade), pane: "quality" })
          .on("mouseover", () => showTags(line.tags))
          .addTo(map);
      });
    });
};

document.getElementById("quality").onclick = function() {
  console.log(map);

  const pane = map.getPane("quality");
  if (!pane) return quality(map, zIndexBase + 10);

  const mode = pane.style.display == "none" ? "block" : "none";
  pane.style.display = mode;
  document.querySelector("pre#tags").style.display = mode;
};

export const qualityExport = "qualityExport";
