require "./ex25.rb"

# assign a string to the variable sentence
sentence = "All good things come to those who wait."

# call the function break_words in the modoule Ex25
# enter sentence as the argument
# the function returns an array of the words, assign this to 'words'
words = Ex25.break_words(sentence)
# show the value of 'words'
words
# call the function sort_words in the module Ex25
# enter the words array as an argument
# the function returns a sorted array of the words, assign this to 'sorted_words'
sorted_words = Ex25.sort_words(words)
# show the value of sorted_words
sorted_words
# call the print_first_word function in module Ex25
# give it an argument of the words (array of words)
# the first word of the list is printed
Ex25.print_first_word(words)
# call the print_last_word function in module Ex25
# give it an argument of the words variable (array of words)
# the last word of the list is printed
Ex25.print_last_word(words)
# show the value of words
# (It will be missing the first and last word, because
# the previous two functions called removed the first and last elements)
words
# call print_first_word function, give it the sorted_words array as an argument
# the first word is printed
Ex25.print_first_word(sorted_words)
# call print_last_word function, give it the sorted_words array as an argument
# the last word is printed
Ex25.print_last_word(sorted_words)
# show the value of sorted_words
# (It will be missing the first and last element compared to before)
sorted_words
# call the sort_sentence function on the sentence string
# assign the returned list of words to the sorted_words variable
sorted_words = Ex25.sort_sentence(sentence)
# show the value of sorted_words, it is now the full list again
sorted_words
# call the print_first_and_last function on the sentence
# a copy of the sentence is created for the function
# the sentence is broken up into words, and 
# the first and last words are printed
Ex25.print_first_and_last(sentence)
# call the print_first_and_last function on the sentence
# a copy of the sentence is split up into words,
# the words are sorted, then the first and last words are printed
Ex25.print_first_and_last_sorted(sentence)

# NOTE: if we type 'sentence' now, we will see sentence remains unchanged. 