# SVGPather allows to draw routing graphs using simple commands. Example usage:
#
#    s = SVGPather.new("#000")
#    s.line(:center)
#    s.conn(:center, :right)
#    s.commit
#    s.line(:center)
#    s.conn(:center, :left)
#    s.conn(:center, :right)
#    s.commit
#    s.dotted(:center)
#    s.commit
#    s.split
#    s.commit
#    s.line(:left)
#    s.dotted(:right)
#    s.commit
#    s.line(:left)
#    s.conn(:left, :left)
#    s.commit
#    s.line(:right)
#    s.conn(:right, :right)
#    s.commit
#    File.write("route.svg", s.to_s)
#
# The first argument is mostly x position and allows left/center/right.
# `conn` has a 2nd argument, indicating in which direction the connection goes.
# `commit` advances to the next line.
# You can draw more than one object per line.

class SVGPather
  BLOCK_SIZE = 500
  STROKE_WIDTH = 100

  def initialize(color)
    @svg = ""
    @color = color
    @vpos = 0
    @hpos = 0
  end

  attr_reader :color

  # finishes current line and moves to next
  def commit
    @vpos += 1
    @svg << "\n"
  end

  # Shorthand to save you on if/else. The following two are the same:
  #     line(pos, something)
  #     something ? dotted(pos) : solid(pos)
  def line(position, dot)
    dot ? dotted(position) : solid(position)
  end

  def solid(position)
    @svg << %|<path stroke="#{color}" d="M #{pos(position)},#{top} V #{bottom}" stroke-width="#{STROKE_WIDTH}"/>|
  end

  def dotted(position)
    @svg << %|<path stroke="#{color}" stroke-opacity="0.4" d="M #{pos(position)-30},#{top-25} V #{bottom}" stroke-width="40" stroke-dasharray="50"/>|
    @svg << %|<path stroke="#{color}" stroke-opacity="0.4" d="M #{pos(position)+30},#{top-25} V #{bottom}" stroke-width="40" stroke-dasharray="50"/>|
  end

  def split
    # TODO: make subject of block size?
    l = %|<g stroke="#{color}" stroke-width="#{STROKE_WIDTH}" fill="none"><path d="M 0,500 C 0,375 62.5,312.5 125,250 C 187.5,187.5 250,125 250,0"/></g>|
    r = %|<g stroke="#{color}" stroke-width="#{STROKE_WIDTH}" fill="none"><path d="M 500,500 C 500,375 437.5,312.5 375,250 C 312.5,187.5 250,125 250,0"/></g>|
    @svg << %|<g transform="translate(#{left}, #{top})">#{l}#{r}</g>|
  end

  def conn(position, direction)
    raise "Can only point right when on right side" if direction != :right && position == :right
    raise "Can only point left when on left side" if direction != :left && position == :left

    arc = if direction == :left
      %|<path stroke="#{color}" d="M #{center},#{top} A #{middle},#{middle} 0 0 1 #{left},#{top+middle}" stroke-width="#{STROKE_WIDTH}" fill="none"/>|
    elsif direction == :right
      %|<path stroke="#{color}" d="M #{center},#{top} A #{middle},#{middle} 1 0 0 #{right},#{top+middle}" stroke-width="#{STROKE_WIDTH}" fill="none"/>|
    else
      raise "Unknown direction, choose left/right"
    end

    @svg << case(position)
    when :left then  %|<g transform="translate(-#{BLOCK_SIZE/2}, 0)">#{arc}</g>|
    when :right then %|<g transform="translate(+#{BLOCK_SIZE/2}, 0)">#{arc}</g>|
    when :center then arc
    else raise "Unknown position, choose left/center/right"
    end
  end

  def split_conn(direction)
    conn(:center, direction)
    w = 0.10*BLOCK_SIZE
    if direction == :left
      @svg << %|<path d="M #{left+w},#{top+middle} H #{left-w}" fill="none" stroke-width="#{STROKE_WIDTH}" stroke="#{color}" />|
    else
      @svg << %|<path d="M #{right+w},#{top+middle} H #{right-w}" fill="none" stroke-width="#{STROKE_WIDTH}" stroke="#{color}" />|
    end
  end

  def stop(position)
    x = pos(position)
    w = (0.28*BLOCK_SIZE).round
    @svg << %|<path d="M #{x+w},#{bottom-STROKE_WIDTH/2} H #{x - w}" fill="none" stroke-width="#{STROKE_WIDTH}" stroke="#{color}" />|
  end

  def to_s
    %|<svg xmlns="http://www.w3.org/2000/svg" width="#{2*BLOCK_SIZE}" height="#{bottom - BLOCK_SIZE}">\n#{@svg}\n</svg>|
  end

  private

  def pos(position)
    case(position)
    when :left then left
    when :right then right
    when :center then center
    else raise "Unknown position, choose left/center/right"
    end
  end

  def left
    BLOCK_SIZE / 2
  end

  def right
    left + BLOCK_SIZE
  end

  def center
    left + BLOCK_SIZE / 2
  end

  def top
    BLOCK_SIZE*@vpos
  end

  def middle
    BLOCK_SIZE / 2
  end

  def bottom
    BLOCK_SIZE*(@vpos+1)
  end

end
