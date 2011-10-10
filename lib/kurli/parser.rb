module Kurli
  class Parser

    def initialize(data_string)
      require 'json'
      JSON.parse(data_string)
    end

    def fetch_courses
      []
    end

  end
end
