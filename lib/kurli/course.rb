module Kurli
  class Course

    attr_reader :code, :credits

    def initialize(code, name, credits, level)
      @code = code
      @credits = credits
      @level = level
    end

    def basic?
      @level == 'A'
    end

    def intermediate?
      @level == 'C'
    end

    def advanced?
      @level == 'L'
    end

    def other?
      !(basic? or intermediate? or advanced?)
    end

  end
end
