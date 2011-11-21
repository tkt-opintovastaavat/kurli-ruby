require 'kurli/server'
require 'kurli/parser'
require 'kurli/course'

module Kurli

  class Kurli

    def initialize(uri)
      @server = ::Kurli::Server.new(uri)
    end

  end

end
