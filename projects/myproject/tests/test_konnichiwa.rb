require "./lib/konnichiwa.rb"
require "test/unit"

class TestName < Test::Unit::TestCase

  def test_sample
    assert_equal("5", 5.to_s)
  end

end