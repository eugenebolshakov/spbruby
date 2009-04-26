# a partial rip off of http://snippets.dzone.com/posts/show/7109 

class EasterDate
  attr_accessor :year

  def initialize(year)
    @year = year.to_i
  end

  def catholic_date
    if julian? 
      dominical_number = (year + (year / 4) + 5) % 7
      paschal_full_moon = (3 - (11 * golden_number) - 7) % 30
    else
      # Gregorian calendar
      dominical_number = (year + (year / 4) - (year / 100) + (year / 400)) % 7
      solar_correction = (year - 1600) / 100 - (year - 1600) / 400
      lunar_correction = (((year - 1400) / 100) * 8) / 25
      paschal_full_moon = (3 - 11 * golden_number + solar_correction - lunar_correction) % 30
    end

    dominical_number += 7 until dominical_number > 0 

    paschal_full_moon += 30 until paschal_full_moon > 0 
    paschal_full_moon -= 1 if paschal_full_moon == 29 or (paschal_full_moon == 28 and golden_number > 11)

    difference = (4 - paschal_full_moon - dominical_number) % 7
    difference += 7 if difference < 0 

    day_easter = paschal_full_moon + difference + 1

    if day_easter < 11 then
      # Easter occurs in March.
      DateTime.new(year, 3, day_easter + 21)
    else
      # Easter occurs in April.
      DateTime.new(year, 4, day_easter - 10)
    end
  end

  def orthodox_date
    # according to wikipedia
    a = (19 * (year % 19) + 15) % 30
    b = (2 * (year % 4) + 4 * (year % 7) + 6 * a + 6) % 7
    new_style(if (a + b) > 9
      DateTime.new(year, 4, a + b - 9)
    else
      DateTime.new(year, 3, 22) + (a + b).days
    end)
  end

  private

    def golden_number
      @golden_number ||= (year % 19) + 1
    end

    def julian?
      year <= 1752
    end

    def new_style(date)
      date + 13.days
    end
end
