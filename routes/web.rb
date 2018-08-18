require "json"
require "nokogiri"
require "webcache"

CACHE = WebCache.new.tap { |c| c.life = 7*24*60*60 }
PARSED_CACHE = {}

def get_xml(url)
  PARSED_CACHE[url] ||= begin
    print "."
    Nokogiri::HTML(CACHE.get(url).to_s)
  end
end

def get(url)
  PARSED_CACHE[url] ||= begin
    print "."
    JSON.parse(CACHE.get(url).to_s)
  end
rescue JSON::ParserError => e
  warn "\n\nURL #{url} failed to parse: #{e}"
  raise e
end
