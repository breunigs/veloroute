#!/usr/bin/env ruby

require 'json'
require 'yaml'

KNOWN = %w[
  type
  title
  start
  end
  construction_site_id_hh
  tags
  text
  summary
  tracks
  updated
  icon
  loc
]

def to_camel_case(str)
  words = str.split('-')
  a = words.first
  b = words[1..words.length - 1].map{|x|x.capitalize}
  new_array = []
  new_array << a << b
  x = new_array.flatten.join('')
  x[0] = x[0].upcase
  x
end

files=Dir.glob("./data/articles/20*.yaml").sort.map do |art|
  parsed = YAML.load_file(art)
  unknown = parsed.keys - KNOWN

  created_at = File.basename(art)[0..9]
  name = File.basename(art, ".*")[11..-1]

  if unknown.size>0
    warn "unknown keys in YAML: #{unknown.inspect}"
    require 'pry'; binding.pry
  end

  summary = if parsed["summary"]
    "def summary(), do: #{parsed.fetch("summary").to_json}"
  end

  start = if parsed["start"]
    "def start(), do: ~d[#{parsed.fetch("start")}]"
  end
  stop = if parsed["end"]
    "def stop(), do: ~d[#{parsed.fetch("end")}]"
  end
  updated = if parsed["updated"]
    "def updated(), do: ~D[#{parsed.fetch("updated")}]"
  end
  icon = if parsed["icon"]
    "def icon(), do: :#{parsed.fetch("icon")}"
  end

  tmp = parsed["construction_site_id_hh"]
  constr = if tmp.is_a?(Array)
    "def construction_site_id_hh(), do: [#{tmp.join(", ")}]"
  elsif tmp.is_a?(Integer)
    "def construction_site_id_hh(), do: [#{tmp}]"
  end

      # %Video.Track{
      #   group: "1",
      #   direction: :forward,
      #   from: "Innenstadt",
      #   to: "Rissen",
      #   parent_ref: __MODULE__,
      #   text: "aus der Innenstadt nach Rissen",
      #   videos: [
      #     {"2021-06-05-velorouten-1-1a-2/GX011629", "00:00:12.246", :end},
      #   ]

# tracks:
# - group: detour
#   direction: forward
#   text: "Umleitung Tiergartenstraße"
#   videos:
#   - ["2021-08-01-freizeit9-anfang/GX012481", "00:00:03.070", "end"]
# - group: detour
#   direction: backward
#   text: "Umleitung Tiergartenstraße"
#   videos:
#   - ["2021-08-01-freizeit9-anfang/GX012472", "00:00:15.949", "end"]
#   - ["2021-08-01-freizeit9-anfang/GX012473", "start", "end"]
#   - ["2021-08-01-freizeit9-anfang/GX012474", "start", "end"]
#   - ["2021-08-01-freizeit9-anfang/GX012475", "start", "end"]
#   - ["2021-08-01-freizeit9-anfang/GX012476", "start", "end"]
#         ]


  tracks = if parsed["tracks"]
    x = parsed["tracks"].map do |t|
      videos = t["videos"].map do |v|
        xstart = v[1] == "start" ? ':start' : "\"#{v[1]}\""
        xstop = v[2] == "end" ? ':end' : "\"#{v[2]}\""
        "{\"#{v[0]}\", #{xstart}, #{xstop}}"
      end

      <<~ELIXIR
        %Video.Track{
          group: "#{t.fetch("group")}",
          direction: :#{t.fetch("direction")},
          from: "#{t["from"]}",
          to: "#{t["to"]}",
          parent_ref: __MODULE__,
          text: "#{t.fetch("text")}",
          videos: [
            #{videos.join(",\n")}
          ]
        }
      ELIXIR
    end.map(&:strip)

    <<~ELIXIR
      def tracks(),
        do: [
          #{x.join(",\n")}
        ]
    ELIXIR
  end

  doc = <<~ELIXIR
    defmodule Data.Article.Blog.#{to_camel_case(name).sub(/^[0-9-]+/, '')} do
      use Article.Default

      def name(), do: "\#{created_at()}-#{name}"
      def created_at(), do: ~D[#{created_at}]
      #{updated}
      def title(), do: #{parsed.fetch("title").to_json}
      #{icon}

      #{summary}

      #{start}
      #{stop}

      def type(), do: #{parsed["type"] ? ":#{parsed["type"]}" : "nil"}
      #{constr}
      def tags(), do: #{(parsed["tags"] || []).to_json}

      #{tracks}

      def links() do
        [        ]
      end

      def text(assigns) do
        ~H"""
        #{parsed.fetch("text").strip}
        """
      end
    end
  ELIXIR

  file = "./data/articles/blog/#{File.basename(art, ".*")}.ex"
  File.write(file, doc)
  file
rescue => e
  warn art
  warn e.to_s
  warn e.backtrace.join("\n")
  require 'pry'; binding.pry
end

`mix format #{files.join(" ")} 2>&1 >/dev/null`
