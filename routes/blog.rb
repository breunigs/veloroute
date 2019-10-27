require 'singleton'

require_relative 'util'

class Blog
  include Singleton

  def with_tags(tags)
    posts.select { |p| p.has_tag?(tags) }
  end

  def posts
    @posts ||= begin
      glob = File.join(__dir__, "..", "blog", "*.yaml")
      sort Dir.glob(glob).map { |path| Post.new(path) }
    end
  end

  private

  def sort(posts)
    posts.sort_by { |p| p.date }
  end
end

class Post
  attr_reader :name, :date, :path

  def initialize(path)
    @path = path
    @name = File.basename(path, ".yaml")
    @date = Date.parse(name[0...10])
    @raw = YAML.load_file(path)
  end

  def url
    "/blog/#{name}"
  end

  def ger_date
    date.strftime("%d.%m.%Y")
  end

  def has_tag?(tt)
    tt = [tt] unless tt.is_a?(Array)

    (tags & tt).any?
  end

  def tags
    @tags ||= @raw['tags'].map(&:downcase)
  end

  def title
    @raw['title']
  end

  def text
    @raw['text']
  end

  def linked_text
    html, _places = link_places(text)
    html
  end
end
