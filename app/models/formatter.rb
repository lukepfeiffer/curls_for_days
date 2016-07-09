class Formatter
  attr_reader :string
  attr_reader :date

  def initialize(date)
    @date = date
  end

  def initialize(string)
    @string = string
  end

  def self.date(date)
    if date.year == Date.today.year
      date.strftime("%B %e")
    else
      date.strftime("%B %e, %Y")
    end
  end

  def self.string(string)
    string_length = 125
    string[/(\S+(\s+)?){,#{string_length}}/].strip
  end
end
