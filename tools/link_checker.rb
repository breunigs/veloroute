#!/usr/bin/env ruby

require 'net/http'

threads = []
ignore = [/twitter.com/]

path = File.join(__dir__, "..", "data", "articles", "**", "*.yaml")
Dir.glob(path) do |file|
  links = File.read(file).scan(/http[^" ]+/)
  links.each do |link|
    next if ignore.any? { |ign| link =~ ign }

    threads << Thread.new do
      uri = URI.parse(link)

      begin
        req_path = uri.path
        req_path = "/" if !req_path || req_path == ""
        req_path += "?" + uri.query if uri.query
      rescue => e
        warn "#{file}: #{link} not parsable: #{e}"
        next
      end

      Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == "https") do |http|
        http.request_get(req_path) do |resp|
          next if resp.code == "200"
          warn "#{file}: #{link} returns a #{resp.code}"
        end
      rescue => e
          warn "#{file}: #{link} cannot get reply: #{e}"
      end
    end
  end
end

threads.each(&:join)
