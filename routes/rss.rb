require 'rss'
require 'yaml'

require_relative 'mapillary'
require_relative 'shortcoming'

module RSS
  FILENAME = 'updates.atom'
  BASE = URI("https://veloroute.hamburg")

  def self.list(count:)
    self.newest(shortcomings + image_updates, count: count)
  end

  def self.build_html(count: nil)
    entries = self.list(count: count).map do |data|
      german_date = I18n.localize(data[:updated].to_date, format: :short)
      rel_path = data[:link].route_from(BASE)
      <<~ENTRY
        <li>
          <time datetime="#{data[:updated].strftime("%F")}">#{german_date}</time>
          <a href="#{rel_path}">#{data[:title]}</a>
        </li>
      ENTRY
    end.join

    %|<ol class=" hide-bullets">#{entries}</ol>|
  end

  def self.build_atom
    self.with_header do |items|
      self.list(count: 15).each do |data|
        items.new_item do |item|
          data.each do |k, v|
            next if %i[lonLat image].include?(k)
            item.public_send("#{k}=", v.to_s)
          end
        end
      end
    end.to_s
  end

  def self.shortcomings
    Shortcoming.all.map do |s|
      img_tags = self.to_img_list(s.images)
      {
        link: BASE.merge("/quality/#{s.key}"),
        title: s.full_title,
        updated: self.to_time(s.last_check),
        description: s.desc + '<br>' + img_tags,
        lonLat: s.lonLat,
        image: Mapillary.image_url(s.images.first)
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
        link: BASE.merge(path),
        title: details["title"],
        updated: self.to_time(details["date"]),
        description: self.to_img_list(details['startImage']),
        lonLat: lonLat,
        image: Mapillary.image_url(details['startImage'])
      }
    end
  end

  def self.with_header
    RSS::Maker.make("atom") do |maker|
      maker.channel.author = "veloroute.hamburg"
      maker.channel.updated = Time.now.to_s
      maker.channel.about = BASE.merge("routes/geo/" + FILENAME).to_s
      maker.channel.title = "veloroute.hamburg – Updates zu Baumaßnahmen und neuen Bildern"
      maker.channel.language = :de
      maker.channel.link = BASE.to_s

      yield maker.items
    end
  end

  def self.newest(data, count:)
    all = data.sort_by { |d| d[:updated] }.reverse
    count ? all.first(count) : all
  end

  def self.get_yaml(name)
    YAML.load_file(File.join(__dir__, "..", "#{name}.yaml"))
  end

  def self.to_time(date)
    Date.parse(date.to_s).to_time
  end

  def self.to_img_list(images)
    images = [images] if images.is_a?(String)
    images.first(5).map do |img|
      %|<img src="#{Mapillary.image_url(img)}"/>|
    end.join("<br>")
  end
end
