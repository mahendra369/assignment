# a recursive method
class NumberToWord

  def letter_combinations(digits)
    letters = {"2" => ["a", "b", "c"],"3" => ["d", "e", "f"],"4" => ["g", "h", "i"],"5" => ["j", "k", "l"],"6" => ["m", "n", "o"],"7" => ["p", "q", "r", "s"],"8" => ["t", "u", "v"],"9" => ["w", "x", "y", "z"]}

    dictionary = []
    file_path = Rails.root.join("db","dictionary.txt")
    File.foreach( file_path ) do |word|
      dictionary.push word.chop.to_s.downcase
    end

    #digits = digits.split('')
    words = []
    keys = digits.chars.map{|digit|letters[digit]}
    #words = keys.shift.product(*keys).map(&:join).reverse
    words = product_of_array(keys)

    # # Total number of combinations
    # digits = digits.split('')
    # numbers = digits.inject(1) { |a,b| a * letters[b].size }
    # puts numbers
    # words = []
    # 0.upto numbers-1 do |qu|
    #   word = []
    #   digits.reverse.each do |digit|
    #     qu, r = qu.divmod letters[digit].size
    #     word.unshift letters[digit][r]
    #     if word.length > 2 && dictionary.include?(word.join) && !words.include?(word.join)
    #       words << word.join
    #       #word = []
    #     end
    #   end
    # end

    print words & dictionary
    # return "Done"
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