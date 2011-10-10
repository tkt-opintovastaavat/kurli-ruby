module Kurli
  class Server

    def initialize(path)
      @path = path
    end

    def get
      Net::HTTP.get(URI.parse(@path))
    end

  end
end
