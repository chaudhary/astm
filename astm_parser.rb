require 'yaml'

class AstmParser

  FIELD_IDENTIFIERS = YAML.load(File.read("field_identifiers.yml"))

  ROW_TYPES = {
    'H' => 'header',
    'P' => 'patient',
    'O' => 'order'
  }

  def initialize(message)
    @message = message
  end

  def parse
    message_terms = @message.split("|")
    row_type = ROW_TYPES[message_terms[0]]
    puts row_type
    field_identifiers = FIELD_IDENTIFIERS[row_type]

    parsed_json = {}
    field_identifiers.each do |field, field_identifier_str|
      field_identifier = field_identifier_str.split(' ')

      value = message_terms[
        field_identifier[1].to_i - 1
      ]
      value = (value&.split("^") || [])[
        field_identifier[3].to_i - 1
      ]
      next if value.nil?
      parsed_json[field] = value
    end
    return parsed_json, row_type
  end
end