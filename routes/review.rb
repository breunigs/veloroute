require 'nokogiri'
require 'json'

require_relative "place"
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
      # XXX: xpath doesn't work with fragments
      d = Nokogiri::HTML::fragment(@raw_description)
      d.css("a").each do |link|
        next if link.attr(:href)
        link[:class] = "place"
        link[:href] = Place.find(link.text).url
      end
      d
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
        Manche Programme können damit nicht umgehen und zeigen entweder alles
        auf einmal oder nur ein Teilstück.
        <span class="not-mobile">
          Empfehlung:
          <a href="https://www.gpxsee.org/" target="_blank">GPXSee</a>
          (kostenlos, Windows / OS X / Linux) zeigt die Exporte korrekt an.
        </span>
      </p>
    HTML
  end

  def description_html
    return nil unless description
    <<~HTML
      <h4>Bewertung</h4>
      <p>
        #{description}
        <a href="/quality">Detaillierte Qualitätsbewertung anzeigen</a>.
      </p>
    HTML
  end

  def review_json_ld
    return nil unless @grade && @date && description
    json_ld = {
      "@context": "http://schema.org/",
      "@type": :Review,
      itemReviewed: {
        "@type": :Thing,
        name: "Veloroute #{@route.name} (Alltagsroute)"
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
        <li><a href="/">Erklärung anzeigen</a></li>
      </ul>
    HTML
  end

  def to_html
    [download_html, description_html, review_json_ld, footer].compact.join("\n")
  end
end
