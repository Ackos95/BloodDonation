module ConvertHelpers
  require 'date'

  def self.string_to_bool(str)
    { "true" => true, "false" => false }[str]
  end

  def self.string_to_timestamp(str_date)
    timestamp = DateTime.now unless validate_timestamp str_date
    timestamp ||= DateTime.strptime str_date, '%H:%M %d.%m.%Y'
  end

  def self.validate_timestamp(string)
    format_ok = string.match(/\d{2}\:\d{2}\ \d{2}\.\d{2}\.\d{4}/)
    parseable = DateTime.strptime(string, '%H:%M %d.%m.%Y') rescue false

    format_ok and parseable
  end

  def self.string_to_date_format(str_date)
    date = Time.now unless validate_date str_date
    date ||= Date.strptime(str_date, '%d.%m.%Y')
  end

  def self.validate_date(string)
    format_ok = string.match(/\d{2}\.\d{2}\.\d{4}/)
    parseable = Date.strptime(string, '%d.%m.%Y') rescue false

    format_ok and parseable
  end

end