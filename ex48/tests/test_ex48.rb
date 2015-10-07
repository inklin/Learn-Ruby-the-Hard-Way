require "./lexicon.rb"
require "test/unit"

class TestEx48 < Test::Unit::TestCase

  def test_directions()
    assert_equal([['direction', 'north']], Lexicon.scan("north"))
    result = Lexicon.scan("north south east west")

    assert_equal([['direction', 'north'],
      ['direction', 'south'], ['direction', 'east'],
      ['direction', 'west']], result)
  end

  def test_verbs()
    assert_equal([['verb', 'go']], Lexicon.scan("go"))
    result = Lexicon.scan("go kill eat")

    assert_equal([['verb', 'go'],
      ['verb', 'kill'], ['verb', 'eat']], result)

    result = Lexicon.scan("jump walk run")
    assert_equal([['verb', 'jump'],
      ['verb', 'walk'], ['verb', 'run']], result)
  end

  def test_stops()
    assert_equal([['stop', 'the']], Lexicon.scan("the"))
    result = Lexicon.scan("the in of")
    assert_equal([['stop', 'the'],
      ['stop', 'in'], ['stop', 'of']], result)

    result = Lexicon.scan("to is a")
    assert_equal([['stop', 'to'],
      ['stop', 'is'], ['stop', 'a']], result)
  end

  def test_nouns()
    assert_equal([['noun', 'bear']], Lexicon.scan("bear"))
    result = Lexicon.scan("bear princess")
    assert_equal([['noun', 'bear'], ['noun', 'princess']], result)
  end

  def test_numbers()
    assert_equal([['number', 1234]], Lexicon.scan("1234"))
    result = Lexicon.scan("3 91234 034")
    assert_equal([['number', 3], ['number', 91234],
      ['number', 34]], result)
  end

  def test_names()
    assert_equal([['name', 'Snoopy'], ['name', 'linus'],
      ['name', 'Lucy']], Lexicon.scan("Snoopy linus Lucy"))
  end

  def test_errors()
    assert_equal([['error', 'ASDFADFASDF']], Lexicon.scan("ASDFADFASDF"))
    result = Lexicon.scan("bear IAS princess")
    assert_equal([['noun', 'bear'], ['error', 'IAS'], ['noun', 'princess']], result)
  end

  def test_capitalization()
    assert_equal([['noun', 'Bear']], Lexicon.scan("Bear"))
    result = Lexicon.scan("Bear iS a PRINCESS")
    assert_equal([['noun', 'Bear'], ['stop', 'iS'],
      ['stop', 'a'], ['noun', 'PRINCESS']], result)
  end

  def test_combination()
    result = Lexicon.scan("the bear go north 88 eat")
    assert_equal([['stop', 'the'],['noun', 'bear'], ['verb', 'go'],
      ['direction', 'north'], ['number', 88], ['verb', 'eat']], result)
  end

end