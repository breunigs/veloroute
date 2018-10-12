require 'rss'
require 'yaml'

require_relative 'mapillary'

module RSS
  FILENAME = 'updates.atom'
  BASE = URI("https://veloroute.hamburg")

  def self.build
    self.with_header do |items|
      self.newest(shortcomings + image_updates).each do |data|
        items.new_item do |item|
          data.each { |k, v| item.public_send("#{k}=", v)}
        end
      end
    end.to_s
  end

  def self.shortcomings
    self.get_yaml(:shortcomings).map do |key, details|
      {
        link: BASE.merge("/quality/#{key}").to_s,
        title: "Problemstelle: #{key}",
        updated: self.to_time(details["lastCheck"]),
        description: details["desc"]
      }
    end
  end

  def self.image_updates
    entries = self.get_yaml(:image_updates)
    return [] unless entries
    entries.map do |details|
      lonLat = Mapillary.get_corrected_image_data([details['startImage']]).first[:lonLat]
      anchor = [15, *lonLat.reverse, details['startImage']].join('/')
      path = "/#{details['route']}##{anchor}"
      {
        link: BASE.merge(path).to_s,
        title: details["title"],
        updated: self.to_time(details["date"]),
      }
    end
  end

  def self.with_header
    RSS::Maker.make("atom") do |maker|
      maker.channel.author = "veloroute.hamburg"
      maker.channel.updated = Time.now.to_s
      maker.channel.about = BASE.merge(FILENAME).to_s
      maker.channel.title = "veloroute.hamburg – Updates zu Baumaßnahmen und neuen Bildern"

      yield maker.items
    end
  end

  def self.newest(data, count: 10)
    data.sort_by { |d| d[:updated] }.reverse.first(count)
  end

  def self.get_yaml(name)
    YAML.load_file(File.join(__dir__, "..", "#{name}.yaml"))
  end

  def self.to_time(date)
    Date.parse(date).to_time
  end
end
