class Lexicon
  @@dictionary = {
    'direction' => ['north', 'south', 'east', 'west'],
    'verb' => ['go', 'eat', 'kill'],
    'stop' => ['the', 'in', 'of'],
    'noun' => ['bear', 'princess']
  }

  def self.scan(text)
    text_elements = text.split(' ')
    result = []

    # go through each text element
    text_elements.each do |text_element|
      categorized = []

      # first we check if the word is a number, 
      # we do this first so we don't have to go through the dictionary
      # if it's a number
      number = Lexicon.convert_number(text_element)
      if (number) 
        categorized = ['number', number]
        result.push(categorized)
        next
      end

      # go through the dictionary
      @@dictionary.each do |type, list|
        # see if the element is in the word list
        if list.include?(text_element)
          # if it is, add the categorized word to the result
          # and you don't have to look at the other word lists
          # so break out of the dictionary loop
          categorized = [type, text_element]
          result.push(categorized)
          break
        end
      end

      # if the word is not categorized, add it as an error
      if (categorized.empty?)
        categorized = ['error', text_element]
        result.push(categorized)
      end

    end

    return result
  end

  def self.convert_number(object)
    begin
      return Integer(object)
    rescue
      return nil
    end
  end

end