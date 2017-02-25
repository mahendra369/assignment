# a recursive method
class NumberToWord


  def letter_combinations(digits)
    letters = {"2" => ["a", "b", "c"],"3" => ["d", "e", "f"],"4" => ["g", "h", "i"],"5" => ["j", "k", "l"],"6" => ["m", "n", "o"],"7" => ["p", "q", "r", "s"],"8" => ["t", "u", "v"],"9" => ["w", "x", "y", "z"]}
    dictionary = []
    file_path = Rails.root.join("db","dictionary.txt")
    File.foreach( file_path ) do |word|
      dictionary.push word.chop.to_s.downcase
    end
    keys = digits.chars.map{|digit|letters[digit]}
    results = {}
    total_number = keys.length - 1
    for i in (2..total_number)
      first_array = keys[0..i]
      second_array = keys[i + 1..total_number]
      next if first_array.length < 3 || second_array.length < 3
      results[i] = [first_array.shift.product(*first_array).map(&:join), second_array.shift.product(*second_array).map(&:join)]
    end
    #results[9] = keys.shift.product(*keys).map(&:join)
    results.each do |key, combinataion|
      first_combo = (combinataion.first & dictionary)
      second_combo = (combinataion.last & dictionary)
      next if first_combo.blank? || second_combo.blank?

      #results[key] = [, ]
    end

    #debugger
    #print results
  end

  def product_of_array(keys, words=[])
    temp_array = []
    unless keys.blank?
      keys.each do |array_of_letters|
        if words.blank?
          words = array_of_letters
        else
          temp_array = words.dup
          words = words.product(array_of_letters).map(&:join)
          words.flatten!
          words << temp_array
          words.flatten!
        end
      end
      #keys.shift
      #words, keys = product_of_array(keys, words)
    end
    return words.reject{|a|a.length < 3}
  end


    # @return a list of strings, [s1, s2]
  # def letter_combinations(digits)
  #   # define a dictionary of the character <-> number projection
  #   pad = {'2':'abc', '3':'def', '4':'ghi', '5':'jkl', '6':'mno', '7':'pqrs', '8':'tuv', '9':'wxyz'}
  #   # if the input is empty
  #   if digits.blank? || digits.length == 0
  #     return [""]
  #   end

  #   # for number string length equals n-1
  #   d0 = digits[-1]
  #   comb0 = self.letter_combinations(d0)

  #   # combine the last digit with previous n-1 string
  #   d1 = digits[-1]
  #   string1 = pad[d1]
  #   comb1 = []
  #   #  consider every combinations
  #   for s in string1
  #     for c in comb0
  #       cs = c+s
  #       comb1.push(cs)
  #     end
  #   end
  #   return comb1
  # end

end