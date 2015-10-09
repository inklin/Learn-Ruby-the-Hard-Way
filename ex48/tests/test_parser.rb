require "./lib/ex48/parser.rb"
require "test/unit"

class TestEx49 < Test::Unit::TestCase

  def test_verb()
    result = Parser.parse_verb([['stop', 'at'], ['stop', 'the'], ['verb', 'walk']])
    assert_equal(['verb', 'walk'], result)
  end

end