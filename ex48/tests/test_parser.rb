require "./lib/ex48/parser.rb"
require "test/unit"

class TestEx49 < Test::Unit::TestCase

  def test_peek()
    result = Parser.peek([['stop', 'the'], ['noun', 'princess']])
    assert_equal("stop", result)
    assert_equal(nil, Parser.peek(nil))
  end

  def test_match()
    assert_equal(['noun', 'nose'], Parser.match([['noun', 'nose'], ['verb', 'eat']], 'noun'))
    assert_equal(nil, Parser.match(nil, 'noun'))
    assert_equal(nil, Parser.match([['noun', 'nose'], ['verb', 'eat']], 'verb'))
  end

  def test_skip_function()
    assert_equal(nil, Parser.skip([['stop', 'the'], ['noun', 'bear']], 'stop'))
    assert_equal(nil, Parser.skip([['stop', 'the'], ['noun', 'bear']], 'noun'))
  end

  def test_parse_verb()
    result = Parser.parse_verb([['stop', 'at'], ['stop', 'the'], ['verb', 'walk']])
    assert_equal(['verb', 'walk'], result)

    assert_raise ParserError do
      Parser.parse_verb([['stop', 'at'], ['stop', 'the'], ['noun', 'bear']])
    end
  end

  def test_parse_object()
    assert_equal(['noun', 'princess'], Parser.parse_object([['stop', 'at'], ['stop', 'the'], ['noun', 'princess']]))
    assert_equal(['direction', 'west'], Parser.parse_object([['stop', 'at'], ['stop', 'the'], ['direction', 'west']]))

    assert_raise ParserError do
      Parser.parse_object([['stop', 'at'], ['stop', 'the'], ['verb', 'walk']])
    end

  end

  def test_parse_subject()
    assert_equal(['noun', 'princess'], Parser.parse_subject([['stop', 'at'], ['stop', 'the'], ['noun', 'princess']]))
    assert_equal(['noun', 'player'], Parser.parse_subject([['verb', 'walk'], ['stop', 'the'], ['noun', 'bear']]))

    assert_raise ParserError do
      Parser.parse_subject([['stop', 'the'], ['stop', 'in'], ['direction', 'north']])
    end
  end

  def test_parse_sentence()
    sentence = Parser.parse_sentence([['stop', 'the'], ['noun', 'bear'], ['verb', 'saw'], ['stop', 'the'], ['number', 2], ['noun', 'castle']])
    assert_equal("bear", sentence.subject)
    assert_equal("saw", sentence.verb)
    assert_equal("castle", sentence.object)
    assert_equal(2, sentence.number)

    result = Parser.parse_sentence([['verb', 'saw'], ['stop', 'the'], ['noun', 'castle']])
    assert_equal("player", result.subject)
    assert_equal("saw", result.verb)
    assert_equal("castle", result.object)
    assert_equal(1, result.number) 
  end

end