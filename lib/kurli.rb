require 'kurli/server'
require 'kurli/parser'
require 'kurli/course'

module Kurli

  class Kurli

    def initialize(uri)
      @server = ::Kurli::Server.new(uri)
    end

    def perform
      data = @server.get
      parser = ::Kurli::Parser.new(data)
      parser.fetch
    end

  end

end
