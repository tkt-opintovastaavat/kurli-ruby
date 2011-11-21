module Kurli
  class Parser

    def initialize(data_string)
      require 'json'
      @json = JSON.parse(data_string)
    end

    def fetch_courses
      @json.map{ |course_data| parse_course(course_data) }
    end

    private

    def parse_course(data)
      ::Kurli::Course.new(data["code"],
                          parse_name(data["name"]),
                          data["credits"],
                          data["level"]
                         )
    end

    def parse_name(name_data)
      parsed_names = {}
      name_data.each do |key, value|
        parsed_names[key.to_sym] = value
      end
      parsed_names
    end

  end
end
