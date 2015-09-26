require 'open-uri'

WORD_URL = "http://learncodethehardway.org/words.txt"
WORDS = []

PHRASES = {
  "class ### < ###\nend" =>
    "Make a class named ### that is-a ###.",
  "class ###\n\tdef initialize(@@@)\n\tend\nend" =>
    "class ### has-a initialize that takes @@@ parameters.",
  "class ###\n\tdef ***(@@@)\n\tend\nend" =>
    "class ### has-a function named *** that takes @@@ parameters.",
  "*** = ###.new()" =>
    "Set *** to an instance of class ###.",
  "***.***(@@@)" =>
    "From *** get the *** function, and call it with parameters @@@.",
  "***.*** = '***'" =>
    "From *** get the *** attribute and set it to '***'."
}

# a boolean value, if ARGV[0] == "english", PHRASE_FIRST will be assigned true
PHRASE_FIRST = ARGV[0] == "english"

# open the words.txt 
# for each line in the file, remove the \n at the end
# and add the word to the WORDS
# array
open(WORD_URL) { |f|
  f.each_line { |word| WORDS.push(word.chomp)}
}

def craft_names(rand_words, snippet, pattern, caps=false)
  # snippet.scan(pattern) returns a result array with matched strings
  # for example ["###", "###"]
  # for each element in the array, assign a word from rand_words
  # (remove the last word from rand_words and assign it to the element)
  names = snippet.scan(pattern).map do
    word = rand_words.pop()
    # if caps is true, capitalize the word
    # otherwise, leave as is.
    caps ? word.capitalize : word
  end

  # now names is an array of names

  # return an array double the length with the values repeated
  # like such ["First", "Second"] * 2 --> ["First", "Second", "First", "Second"]
  # (This is because we want to use these words in both the snippet and the phrase)
  return names * 2
end

def craft_params(rand_words, snippet, pattern)
  # scan the snippet for the pattern and get the length
  # We use the range operator to get (0..length), map that array
  names = (0...snippet.scan(pattern).length).map do
    # get a parameter count between 1 and 3 (inclusive)
    param_count = rand(3) + 1
    # for however many parameters there are, get 3 random words
    params = (0...param_count).map { |x| rand_words.pop() }
    # join the 3 random words together into a string
    params.join(',')
  end

  # names would be an array of strings
  # for example a snippet scan that returns an array with length 2
  # could return something like ["apples, oranges", "bananas, strawberries, pears"]

  # return the names * 2, because we want to use the same parameter
  # names for both the snippet and the phrase
  return names * 2
end

def convert(snippet, phrase)
  # randomly sort the words, rand_words is an array of the words in random order
  rand_words = WORDS.sort_by {rand}
  # craft the class names array
  class_names = craft_names(rand_words, snippet, /###/, caps=true)
  # craft the other_names array
  other_names = craft_names(rand_words, snippet, /\*\*\*/)
  # craft the param_names array
  param_names = craft_params(rand_words, snippet, /@@@/)

  results = []

  # "sentence": do snippet, then phrase
  [snippet, phrase].each do |sentence|
    # replace all /###/ (stand for class name) with the last element of class_names
    result = sentence.gsub(/###/) {|x| class_names.pop}

    # replace all \*\*\* (stand for other names) with the last element of other_names
    result.gsub!(/\*\*\*/) {|x| other_names.pop}

    # replace all /@@@/ (parameter names) with the last element of param_names
    result.gsub!(/@@@/) { |x| param_names.pop}

    # push the new "sentence" (now with the words put in) to the results array
    results.push(result)
  end

  # results returns a 2-element array, first the "snippet" then the "phrase"
  return results
end

# keep going until they hit CTRL-D
loop do
  # get the keys from the PHRASES (an array)
  # sort the array randomly, and assign it to snippets
  snippets = PHRASES.keys().sort_by {rand}

  # go through each snippet in snippets
  for snippet in snippets
    # the phrase (value) is PHRASES[key]
    phrase = PHRASES[snippet]
    # convert the snippet and phrase
    # assign the returned values to question and answer
    question, answer = convert(snippet, phrase)

    # If PHRASE_FIRST is true
    # reassign the values (switch the values)
    # so that the English phrase shows first, then the code (question)
    if PHRASE_FIRST
      question, answer = answer, question
    end

    # print the question
    print question, "\n\n>"

    # if the user enters input, do not exit
    # otherwise, exit the program
    exit(0) unless $stdin.gets

    # print the answer
    puts "\nANSWER: %s\n\n" % answer
  end
end