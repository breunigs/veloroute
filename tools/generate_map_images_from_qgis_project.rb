#!/usr/bin/env ruby

require 'nokogiri'

REGEX = {
  row: / (\d+),0,graya?\(255(?:,1)?\)/,
  col: / 0,(\d+),graya?\(255(?:,1)?\)/
}

def extract(path, nth, direction)
  crop = case direction
    when :row then "x1+#{nth}+0"
    when :col then "1x+0+#{nth}"
    else raise "invalid direction"
  end

  raw = `convert -quiet #{path} -colorspace Gray -background black -alpha remove -fill white +opaque black -crop '#{crop}' sparse-color:`
  pixels = raw.scan(REGEX.fetch(direction)).flatten.map(&:to_i)

  pixels.sum / pixels.size.to_f / raw.scan("gray").size if pixels
end

# how many cols/rows to scan to find the pixels
MAX_SCAN = 5
def pixel_ratios(image_path)
  top, left = nil, nil
  (0..MAX_SCAN).each do |nth|
    top  ||= extract(image_path, nth, :row)
    left ||= extract(image_path, nth, :col)
  end

  {lat: left, lon: top}
end

def read_project_zip(project_path)
  require "rubygems"
  begin
    require "zip"
  rescue LoadError => e
    system("gem install rubyzip")
    exec($0, *ARGV)
  end

  Zip::File.open(project_path) do |zip|
    zip.each do |entry|
      next unless entry.file?
      next unless File.extname(entry.name) == ".qgs"
      content = nil
      entry.get_input_stream { |io| content = io.read }
      return content
    end
  end
end

def load_project(project_path)
  data = case File.extname(project_path).downcase
  when ".qgs" then File.read(project_path)
  when ".qgz" then read_project_zip(project_path)
  else raise "unsupported file extension"
  end

  project = Nokogiri::XML(data)

  project.css("maplayer").map do |layer|
    layer_name = layer.css("layername").first.content

    image_path_relative = layer.css("datasource").first.content
    image_path_abs = File.expand_path(
      File.absolute_path?(image_path_relative) \
        ? image_path_relative \
        : File.join(project_path, "..", image_path_relative)
    )
    image_base_name = File.basename(image_path_relative, ".*")
    _name, index = image_base_name.sub("_modified", "").split("_", 2)

    next warn("# skipping layer #{layer_name}: doesn't look like georeferenced layer") if layer_name != image_base_name
    next warn("# skipping layer #{layer_name}: image not found at #{image_path_abs}") unless File.exist?(image_path_abs)

    bbox = {
      min_lon: layer.css("wgs84extent xmin").first.content.to_f,
      min_lat: layer.css("wgs84extent ymin").first.content.to_f,
      max_lon: layer.css("wgs84extent xmax").first.content.to_f,
      max_lat: layer.css("wgs84extent ymax").first.content.to_f,
    }

    index = "\"#{index}\"" if index && index !~ /^[0-9]+$/

    {image_path: image_path_abs, bbox: bbox, index: index}
  end.compact
end

def locate(bb, dir, ratio)
  min = bb.fetch(:"min_#{dir}")
  max = bb.fetch(:"max_#{dir}")
  round(min + (max - min)*ratio)
end

def round(num)
  '%.9f' % num
end

def indent(str, num)
  space = " " * num
  str.split("\n").join("\n#{space}")
end

def calculate_map_image(layer)
  pr = pixel_ratios(layer.fetch(:image_path))
  bbox = layer.fetch(:bbox)
  index = layer.fetch(:index) ? "#{layer.fetch(:index)}, " : ""

  <<~ELIXIR
    Data.MapImage.new(__MODULE__, @attrib, #{index}{
      %{lat: #{round(bbox[:max_lat])}, lon: #{locate(bbox, :lon, pr[:lon])}},
      %{lat: #{locate(bbox, :lat, pr[:lat])}, lon: #{round(bbox[:max_lon])}},
      %{lat: #{round(bbox[:min_lat])}, lon: #{locate(bbox, :lon, 1-pr[:lon])}},
      %{lat: #{locate(bbox, :lat, 1-pr[:lat])}, lon: #{round(bbox[:min_lon])}},
      # ↑ original's top left corner is top-center in rotated image (i.e. clockwise rotation)
      # ↓ original's top right corner is top-center in rotated image (i.e. counterclockwise)
      #%{lat: #{locate(bbox, :lat, 1-pr[:lat])}, lon: #{round(bbox[:min_lon])}},
      #%{lat: #{round(bbox[:max_lat])}, lon: #{locate(bbox, :lon, pr[:lon])}},
      #%{lat: #{locate(bbox, :lat, pr[:lat])}, lon: #{round(bbox[:max_lon])}},
      #%{lat: #{round(bbox[:min_lat])}, lon: #{locate(bbox, :lon, 1-pr[:lon])}},
    })
  ELIXIR
end

if ARGV.empty?
  warn <<~DOC
    USAGE:
      Provide script with a QGIS Project file, and it will print the resulting
      map images code:

      #{$0} some.qgs [some.qgz, …]
  DOC
end

ARGV.each do |project_path|
  project_path = File.expand_path(project_path)
  puts "#####################################################################"
  puts "# #{project_path}"
  puts "#####################################################################"
  layers = load_project(project_path)
  puts

  code = layers.map do |layer|
    Thread.new { Thread.current[:output] = calculate_map_image(layer) }
  end.map do |thr|
    thr.join && thr[:output]
  end

  puts <<~ELIXIR
      <.h4_planning ref={@ref} checked={@show_map_image}/>

  ELIXIR

  if code.size == 1
    puts <<~ELIXIR
      def map_image do
        #{indent(code.first, 2)}
      end
    ELIXIR
  else
    puts <<~ELIXIR
      def map_image do
        [
          #{indent(code.map(&:strip).join(",\n"), 4)}
        ]
      end
    ELIXIR
  end
end
