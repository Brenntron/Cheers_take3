require 'date'

class BirthdayParser
  def self.parse(birthday)
    now  = Date.today
    bday = Date.parse(birthday)
  end
end
