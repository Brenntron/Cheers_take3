require 'date'

require_relative 'birthday_parser'

class Cheer
  AN_LETTERS = "HALFNORSEMIX"

  def self.for_birthday(birthday)
    birthday = Date.parse(birthday, '%m-%d-%Y').yday
    now = DateTime.now.yday
    dif = birthday - now

    if dif < 0
      dif = 365 + dif
    end

    case dif
    when 0
      "Awesome! Your birthday is today! Happy Birthday!"
    when 1
       "Awesome! Your birthday is in #{dif} day! Happy Birthday in advance!"
    else
       "Awesome! Your birthday is in #{dif} days! Happy Birthday in advance!"
    end
  end

  def self.for_person(name)
    name.chomp!
    adjusted_name = name.upcase.gsub(/[^A-Z]*/,'')
    raise ArgumentError if adjusted_name.empty?
    output = ""
    adjusted_name.each_char do |char|
      article = (AN_LETTERS.include? char) ? "an.." : "a..."
      output << "Give me #{article} #{char}!\n"
    end
    output + "#{name}'s just GRAND!"
  end

  def self.valid_name?(name)
    cheerable_name = name.upcase.gsub(/[^A-Z]*/,'')
    !cheerable_name.empty?
  end
end
