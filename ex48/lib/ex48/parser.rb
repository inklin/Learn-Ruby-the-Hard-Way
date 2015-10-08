class ParserError < Exception
end

class Sentence
  # we take the ['direction', 'north'] pairs and convert them
  # to subject verb and object 
  def initialize(subject, verb, object)
    # the parameters are 2 element arrays, 
    # with the index 0 holding the type of word it is
    # to get the word, we need index 1
    @subject = subject[1]
    @verb = verb[1]
    @object = object[1]
  end

  attr_reader :subject
  attr_reader :verb
  attr_reader :object
end

# peek function:
# takes a word_list parameter --> returns string or nil

# if the word_list is not empty,
# it looks at the very first word element
# and returns the word type
def peek(word_list)
  if word_list
    word = word_list[0]
    return word[0]
  else
    return nil
  end
end

# match function:
# takes a word_list and an expecting parameter
# it returns a word, or nil

# if the word_list is not empty,
# it removes the first word element and
# if it's 'expecting' type returns the word
def match(word_list, expecting)
  if word_list
    word = word_list.shift

    if word[0] == expecting
      return word
    else
      return nil
    end
  else
    return nil
  end
end

# skip function: skips the specified word type

# it peeks at the word_list, and pops off the word
# if it matches the word_type

# note that the returned word from the match method
# is not stored

def skip(word_list, word_type)
  while peek(word_list) == word_type
    match(word_list, word_type)
  end
end

# parsing a verb
def parse_verb(word_list)
  # remove the beginning stop words
  skip(word_list, 'stop')

  # check to see if the first word is a verb
  # if so, remove the word from the element 
  # and return the word
  if peek(word_list) == 'verb'
    return match(word_list, 'verb')
  # otherwise, raise an error
  else
    raise ParserError.new("Expected a verb next.")
  end
end

# parsing an object
def parse_object(word_list)
  skip(word_list, 'stop')
  next_word = peek(word_list)

  if next_word == 'noun'
    return match(word_list, 'noun')
  elsif next_word == 'direction'
    return match(word_list, 'direction')
  else
    raise ParserError.new("Expected a noun or direction next.")
  end
end

# parsing a noun
# we have to handle an implied 'player' noun
def parse_subject(word_list)
  skip(word_list, 'stop')
  next_word = peek(word_list)

  if next_word == 'noun'
    return match(word_list, 'noun')
  # if the next word is a verb, 
  # we assume that the sentence is missing a subject
  # and we add a 'player' word for the subject
  elsif next_word == 'verb'
    puts "player matched to subject"
    return ['noun', 'player']
  else
    raise ParserError.new("Expected a verb next.")
  end
end

# With the sentence structure S + V + O, 
# parse the sentence 
def parse_sentence(word_list)
  subject = parse_subject(word_list)
  verb = parse_verb(word_list)
  object = parse_object(word_list)

  return Sentence.new(subject, verb, object)
end