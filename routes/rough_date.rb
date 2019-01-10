class RoughDate
  MONTHS = %w[Januar Februar März April Mai Juni Juli August September Oktober November Dezember]

  include Comparable

  def self.range(from, to)
    raise "invalid order, given from: #{from}, to #{to}" if from.known? && to.known? && from > to

    return from.to_s if from == to
    return "ab #{from}" if to.unknown?
    return "bis #{to}" if from.unknown?

    "#{from} bis #{to}"
  end

  def initialize(date)
    @year = nil
    @month = nil
    @quarter = nil

    date = date.to_s.strip
    return if date == ""

    @year = date[0..3].to_i

    case date
    when /^20\d\dQ[1-4]$/
      @quarter = date[5].to_i
    when /^20\d\d-[01]\d$/
      @month =  date.split("-").last.to_i - 1
    when /^20\d\d$/
      # no op
    else
      @year = nil
    end
  end

  attr_reader :year, :quarter, :month

  def to_s
    if @quarter
      "#{quarter_text} #{@year}"
    elsif @month
      "#{month_text} #{@year}"
    elsif year
      year.to_s
    else
      nil
    end
  end

  def known?
    !unknown?
  end

  def unknown?
    @year.nil?
  end

  def <=>(other)
    return 0 if self.unknown? && other.unknown?
    return -1 if other.unknown?
    return 1 if self.unknown?

    return year <=> other.year if year != other.year
    guessed_start_month <=> other.guessed_start_month
  end

  def guessed_start_month
    return month if month
    return (quarter - 1) * 3 + 0.5 if quarter # 0.5 hack sorts it between two months
    0
  end

  private

  def quarter_text
    case @quarter
    # if I say "Winter 2019" I think of "end of 2019", not the beginning. For
    # everything else the season rolls more nicely off the tongue (or brain?)
    when 1 then "1. Quartal"
    when 2 then "Frühjahr"
    when 3 then "Sommer"
    when 4 then "Herbst"
    end
  end

  def month_text
    MONTHS.fetch(@month)
  end
end
