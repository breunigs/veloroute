require "json"
require "nokogiri"
require "webcache"

CACHE = WebCache.new.tap { |c| c.life = 24*60*60 }


def get_xml(url)
  print "."
  Nokogiri::HTML(CACHE.get(url).to_s)
end

def get(url)
  print "."
  JSON.parse(CACHE.get(url).to_s)
rescue JSON::ParserError => e
  warn "\n\nURL #{url} failed to parse: #{e}"
  raise e
end
