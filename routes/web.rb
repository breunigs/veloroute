require "json"
require "nokogiri"
require "webcache"

class WebCache
  alias_method :orig_http_get, :http_get

  THROTTLED_HOSTS = ['nominatim.openstreetmap.org']

  def http_get(url)
    host = URI.parse(url).host
    if THROTTLED_HOSTS.include?(host)
      print '#'
      sleep 1
    else
      print "."
    end

    orig_http_get(url)
  end
end

CACHE = WebCache.new.tap { |c| c.life = 14*24*60*60 }
PARSED_CACHE = {}

def get_xml(url)
  PARSED_CACHE[url] ||= begin
    Nokogiri::HTML(CACHE.get(url).to_s)
  end
end

def get(url, max_retries: 1)
  retries ||= 0
  retries += 1
  PARSED_CACHE[url] ||= begin
    JSON.parse(CACHE.get(url).to_s)
  end
rescue ArgumentError => e
  # most likely corrupted file, i.e. "marshal data too short"
  warn "\n\nURL #{url} had the following error on read. This was try #{retries} of #{max_retries} #{e}"
  CACHE.clear(url)
  sleep(rand)
  retries < max_retries ? retry : raise
rescue Errno::ENOENT => e
  # cache failed to read file, simply retry and hope the race
  # condition went away
  sleep(rand)
  retries < max_retries ? retry : raise
rescue JSON::ParserError => e
  warn "\n\nURL #{url} failed to parse. This was try #{retries} of #{max_retries} #{e}"
  if retries < max_retries
    sleep 5
    retry
  else
    raise e
  end
end
