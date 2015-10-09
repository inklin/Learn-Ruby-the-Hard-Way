class Lexicon
  @@dictionary = {
    'direction' => ['north', 'south', 'east', 'west'],
    'verb' => ['go', 'eat', 'kill', 'jump', 'run',
      'walk'],
    'stop' => ['the', 'in', 'of', 'to', 'a', 'is'],
    'noun' => ['bear', 'princess', 'nose', 'castle', 'cake'],
    'name' => ['snoopy', 'linus', 'lucy']
  }

  def self.scan(text)
    text_elements = text.split(' ')
    result = []

    text_elements.each do |text_element|
      categorized = []

      number = Lexicon.integer?(text_element)
      if (number) 
        categorized = ['number', number]
        result.push(categorized)
        next
      end

      @@dictionary.each do |type, list|
        if list.include?(text_element.downcase)
          categorized = [type, text_element]
          result.push(categorized)
          break
        end
      end

      if (categorized.empty?)
        categorized = ['error', text_element]
        result.push(categorized)
      end

    end

    return result
  end

  def self.integer?(object)
    # remove any trailing zeros so the number
    # does not get interpreted as hex
    object.sub!(/^0+/, "")

    begin
      return Integer(object)
    rescue
      return false
    end
  end

end