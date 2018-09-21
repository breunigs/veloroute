require 'json'

require_relative "util"
require_relative "webpack_helper"

class Review
  def initialize(route, description:, date:, grade:)
    @route = route
    @raw_description = description
    @date = date
    @grade = grade
  end

  def mentioned_places
    return [] unless description
    description.css("a").map(&:text).uniq.map { |p| Place.find(p) }
  end

  def description
    return nil unless @raw_description
    @description ||= begin
      html, _places = link_places(@raw_description)
      html
    end
  end

  def download_html
    <<~HTML
     <h4>Veloroute #{@route.name} Download</h4>
     <p>
        Download im
        <a href="/routes/geo/route#{@route.name}.kml" download><b>KML-Format</b></a>
        oder im
        <a href="/routes/geo/route#{@route.name}.gpx" download><b>GPX-Format</b></a>.
        Alternativ gibt es auch <a href="/routes/geo/routen.zip">alle Routen/Formate im ZIP-Archiv</a>.
        Die Dateien enthalten die Route getrennt nach
        Richtung#{@route.route_count > 1 ? " und Ast" : ""}.
        <br>
        <small>
          Manche Programme können damit nicht umgehen und zeigen entweder alles
          auf einmal oder nur ein Teilstück.
          <span class="not-mobile">
            Empfehlung:
            <a href="https://www.gpxsee.org/" target="_blank">GPXSee</a>
            (kostenlos, Windows / OS X / Linux) zeigt die Exporte korrekt an.
          </span>
        </small>
      </p>
    HTML
  end

  def description_html
    return nil unless description
    <<~HTML
      <h4>Bewertung</h4>
      <div class="review">
        #{description}
        <a href="/quality">Detaillierte Qualitätsbewertung anzeigen</a>.
      </div>
    HTML
  end

  def review_json_ld
    return nil unless @grade && @date && description
    main_route = @route.gpx.first # TODO: represent secondary routes
    json_ld = {
      "@context": "http://schema.org/",
      "@type": :Review,
      itemReviewed: {
        "@type": :TravelAction,
        name: "Veloroute #{@route.name} (Alltagsroute)",
        distance: "#{@route.track.total_length_in_m} m",
        instrument: {
          name: "bicycle",
          alternateName: "velo",
          sameAs: "https://en.wikipedia.org/wiki/Bicycle"
        },
        fromLocation: {
          name: main_route[:places].first.to_s,
          geo: {
            "@type": :GeoCoordinates,
            longitude: main_route[:from][0],
            latitude: main_route[:from][1]
          },
        },
        toLocation: {
          name: main_route[:places].last.to_s,
          geo: {
            "@type": :GeoCoordinates,
            longitude: main_route[:to][0],
            latitude: main_route[:to][1]
          },
        }
      },
      reviewRating: {
        "@type": :Rating,
        # Our 1 (best) to 5 (worst). Schema.org: 5 (best) to 1 (worst)
        ratingValue: 6-@grade.to_i,
      },
      author: {
        "@type": :Person,
        name: "veloroute.hamburg"
      },
      datePublished: @date,
      reviewBody: description.text
    }

    # only include JSON LD for the page currently requested. Let's not confuse
    # the search engines with our hacked together single page application.
    only_if_current_route(@route, %|<script type="application/ld+json">#{json_ld.to_json}</script>|)
  end

  def footer
    <<~HTML
      <h4>Navigation</h4>
      <ul>
        <li><a href="/quality">Radwegqualität bewerten</a></li>
        <li><a href="#{@route.osm_url}" target="_blank">Veloroute #{@route.name} in der OpenStreetMap</a></li>
        <li><a href="/">Startseite</a></li>
      </ul>
    HTML
  end

  def to_html
    [download_html, description_html, review_json_ld, footer].compact.join("\n")
  end
end
