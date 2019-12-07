#!/usr/bin/env ruby

# required os packages:
# awscli
# required external software:
# tippecanoe --- https://github.com/mapbox/tippecanoe

require 'json'
require 'digest'
require 'net/http'
require 'shellwords'

if ENV['MAPBOX_SECRET_TOKEN'].nil? || ENV['MAPBOX_SECRET_TOKEN'] == ""
  raise "Please specify MAPBOX_SECRET_TOKEN"
end

def md5(obj)
  Digest::MD5.hexdigest(obj.to_json)
end

HOST = 'https://api.mapbox.com'.freeze
USERNAME = 'breunigs'.freeze

def uri(path, args = {})
  args = args.merge({access_token: ENV['MAPBOX_SECRET_TOKEN'], cache_buster: Time.now.to_i})
  query = "?" + URI.encode_www_form(args)
  URI.parse("#{HOST}/#{path}#{query}")
end

uri = URI.parse(HOST)
puts "Posting to #{uri}"
$http = Net::HTTP.new(uri.host, uri.port)
$http.use_ssl = true
$headers = {'Content-Type': 'application/json', 'Cache-Control': 'no-cache'}

def success?(response)
  %w[200 201 204].include?(response.code)
end

def debug(request, response)
  puts response.body.to_s
  puts response.to_s
  require 'pry'; binding.pry
end

def get(uri)
  print "."
  request = Net::HTTP::Get.new(uri.request_uri, $headers)
  response = $http.request(request)
  debug(request, response) unless success?(response)

  return JSON.parse(response.body) unless response.body.nil? || response.body == ""
  nil
end

def post(uri, body)
  print "."
  request = Net::HTTP::Post.new(uri.request_uri, $headers)
  request.body = body.to_json

  response = $http.request(request)
  debug(request, response) unless success?(response)

  return JSON.parse(response.body) unless response.body.nil? || response.body == ""
  nil
end

dir = File.join(__dir__, "..", "routes", "geo")
features_file = File.join(dir, "feature_list.geojson")
areas_file = File.join(dir, "article_areas.geojson")
markers_file = File.join(dir, "markers.geojson")

[
  { name: "velo-combi", files: [features_file, areas_file], options: '-zg --drop-densest-as-needed --extend-zooms-if-still-dropping' },
  { name: "markers",    files: [markers_file],              options: '-d18 -D18 -m18 -B0 -z8 -Z8'                                    },
].each do |details|
  puts "Updating tileset #{details[:name]}"
  files = details[:files].map { |f| Shellwords.escape(f) }.join(" ")

  out = `tippecanoe --no-progress-indicator -o /tmp/#{details[:name]}.mbtiles #{files} -f #{details[:options]}`
  raise out unless $?.exitstatus == 0

  aws = get(uri("uploads/v1/#{USERNAME}/credentials"))
  ENV['AWS_ACCESS_KEY_ID'] = aws["accessKeyId"]
  ENV['AWS_SECRET_ACCESS_KEY'] = aws["secretAccessKey"]
  ENV['AWS_SESSION_TOKEN'] = aws["sessionToken"]

  out = `aws s3 cp /tmp/#{details[:name]}.mbtiles s3://#{aws["bucket"]}/#{aws["key"]} --region us-east-1`
  raise out unless $?.exitstatus == 0

  post(uri("uploads/v1/#{USERNAME}"), {
    "url": "http://#{aws["bucket"]}.s3.amazonaws.com/#{aws["key"]}",
    "tileset": "breunigs.#{details[:name]}",
    "name": "#{details[:name]}"
  })
  puts
end
