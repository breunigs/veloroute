const quality = (function(map, index) {
  const pre = document.querySelector("pre#tags");
  const pane = map.createPane("quality");
  pane.style.zIndex = index;

  const colors = [
    "#457FEE", // missing tags
    "#0B7A28", // good
    "#E5D22B", // avg
    "#AA001B"  // bad
  ]

  function gradeTags(tags, verbose) {
    if(verbose) console.debug(`OSM Way=${tags.osm_id}`);

    let marks = [];
    let prefix = "";
    if(tags.cycleway_right) {
      prefix = "cycleway_right_";
    } else if (tags.cycleway_left) {
      prefix = "cycleway_left_";
    }
    let min = 0;

    let width = tags[prefix + "width"];
    if(width && width < 1.5) min = Math.max(min, 2);

    let lit = tags[prefix + "lit"] || tags["lit"];
    if(lit == "no") min = Math.max(min, 2);

    switch(tags[prefix + "smoothness"]) {
      case "excellent":    return Math.max(min, 1);
      case "good":         return Math.max(min, 2);
      case "intermediate": return Math.max(min, 3);
      default:
        switch(tags[prefix + "surface"]) {
          case "asphalt":       return Math.max(min, 1);
          case "paving_stones": return Math.max(min, 2);
          case "cobblestone":   return Math.max(min, 3);
          case "sett":          return Math.max(min, 3);
          default:
            return 0;
        }
    }
  }

  function toColor(grade) {
    return colors[Math.round(grade)];
  }

  function showTags(tags) {
    pre.innerText = JSON.stringify(tags, null, 2);
  }

  fetch("geo/quality.json")
    .then(response => response.json())
    .then(jsonResponse => {
      Object.entries(jsonResponse).forEach(([_index, line]) => {
        const geom = line.geometry.map(([lon, lat]) => [lat, lon]);
        const grade = gradeTags(line.tags);
        L.polyline(geom, {color: toColor(grade), pane: "quality"})
          .on("mouseover", () => {
            gradeTags(line.tags, true);
            showTags(line.tags);
          })
          .addTo(map);
      });
    });
});

document.getElementById("quality").onclick = function() {
  const pane = map.getPane("quality");
  if(!pane) return quality(map, zIndexBase + 10);

  const mode = pane.style.display == "none" ? "block" : "none";
  pane.style.display = mode;
  document.querySelector("pre#tags").style.display = mode;
};

