class AssignmentsController < ApplicationController

  def index
    # words = []
    # file_path = Rails.root.join("db","dictionary.txt")
    # File.foreach( file_path ) do |word|
    #   words.push word.chop
    # end
    @message = "Numbers must be 10 digits long" and return if params[:phone_number].length != 10
    @message = "Wrong Numbers" and return if params[:phone_number].split('').select{|a|(a.to_i == 0 || a.to_i == 1)}.length > 0
    @words = NumberToWord.new.letter_combinations(params[:phone_number])
  end

end
