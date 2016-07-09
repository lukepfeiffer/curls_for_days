class Formatter
  attr_reader :string

  def initialize(string)
    @string = string
  end

  def self.truncate(string)
    string_length = 125
    string[/(\S+(\s+)?){,#{string_length}}/].strip
  end
end
