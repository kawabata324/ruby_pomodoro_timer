# frozen_string_literal: true

require './break'
# 長い休憩
class LongBreak < Break
  def initialize
    super(type: :long)
  end
end
