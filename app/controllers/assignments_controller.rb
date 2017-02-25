class AssignmentsController < ApplicationController

  def index
    # words = []
    # file_path = Rails.root.join("db","dictionary.txt")
    # File.foreach( file_path ) do |word|
    #   words.push word.chop
    # end
    #debugger
    @message = "Wrong Numbers" if params[:phone_number].split('').select{|a|(a.to_i == 0 || a.to_i == 1)}.length > 1
    render :index
  end

end
