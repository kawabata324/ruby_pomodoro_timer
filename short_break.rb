require './break.rb'

class ShortBreak < Break
    def initialize
        super(type: :short)
    end
end