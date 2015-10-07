require "./lexicon.rb"
require "test/unit"

class TestEx48 < Test::Unit::TestCase

  def test_directions()
    assert_equal([['direction', 'north']], Lexicon.scan("north"))
    result = Lexicon.scan("north south east")

    assert_equal([['direction', 'north'],
      ['direction', 'south'], ['direction', 'east']], result)
  end

  def test_verbs()
    assert_equal([['verb', 'go']], Lexicon.scan("go"))
    result = Lexicon.scan("go kill eat")

    assert_equal([['verb', 'go'],
      ['verb', 'kill'], ['verb', 'eat']], result)
  end

  def test_stops()
    assert_equal([['stop', 'the']], Lexicon.scan("the"))
    result = Lexicon.scan("the in of")
    assert_equal([['stop', 'the'],
      ['stop', 'in'], ['stop', 'of']], result)
  end

  def test_nouns()
    assert_equal([['noun', 'bear']], Lexicon.scan("bear"))
    result = Lexicon.scan("bear princess")
    assert_equal([['noun', 'bear'], ['noun', 'princess']], result)
  end

  def test_numbers()
    assert_equal([['number', 1234]], Lexicon.scan("1234"))
    result = Lexicon.scan("3 91234")
    assert_equal([['number', 3], ['number', 91234]], result)
  end

  def test_errors()
    assert_equal([['error', 'ASDFADFASDF']], Lexicon.scan("ASDFADFASDF"))
    result = Lexicon.scan("bear IAS princess")
    assert_equal([['noun', 'bear'], ['error', 'IAS'], ['noun', 'princess']], result)
  end

end