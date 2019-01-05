require 'nokogiri'

require_relative "place"

def link_places(html_string)
  d = Nokogiri::HTML::fragment(html_string)
  places = []
  d.css("a").each do |link|
    next if link.attr(:href)
    places << Place.find(link.text)
    link[:class] = "place"
    link[:href] = places.last.url
    link["data-bbox"] = places.last.bbox.join(",")
    link["data-maxzoom"] = 18
  end
  return d, places
end

def exernal_new_tab(html_string)
  d = Nokogiri::HTML::fragment(html_string)
  d.css("a").each do |link|
    next unless link.attr(:href)&.downcase.start_with?(%r{https?://})
    link[:target] = "_blank"
  end
  return d
end
