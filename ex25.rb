module Ex25

  # This function will break up words for us.
  def Ex25.break_words(stuff)
    # .split splits the sentence into an array of words
    # it splits the words by looking at the ' ' blank spaces
    words = stuff.split(' ')
    # returns an array of the words
    return words
  end

  # Sorts the words.
  def Ex25.sort_words(words)
    # .sort sorts the list of words alphabetically
    return words.sort
  end

  # Prints the first word after shifting it off.
  def Ex25.print_first_word(words)
    # .shift takes an array (list of words), removes the first element, and returns it
    word = words.shift
    puts word
  end

  # Prints the last word after popping it off.
  def Ex25.print_last_word(words)
    # .pop takes an array, removes the last element, and returns it
    word = words.pop
    puts word
  end

  # Takes in a full sentence and returns the sorted words.
  def Ex25.sort_sentence(sentence)
    # break the sentence into an array of words
    words = Ex25.break_words(sentence)
    # returns the sorted array of words
    return Ex25.sort_words(words)
  end

  # Prints the first and last words of the sentence.
  def Ex25.print_first_and_last(sentence)
    # break the sentence into an array of words
    words = Ex25.break_words(sentence)
    # call the print_first_word function on the array
    Ex25.print_first_word(words)
    # call the print_last_word function on the array
    Ex25.print_last_word(words)
  end

  # Sorts the words then prints the first and last one.
  def Ex25.print_first_and_last_sorted(sentence)
    # calls the sort_sentence function on the sentence
    # we get a sorted array of words back
    words = Ex25.sort_sentence(sentence)
    # call print_first_word on the sorted array
    Ex25.print_first_word(words)
    # call print_last_word on the sorted array
    Ex25.print_last_word(words)
  end

end