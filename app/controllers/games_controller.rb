require 'json'
require 'open-uri'
class GamesController < ApplicationController
  
  def new
    @letters = ('A'..'Z').to_a.shuffle[0,10]
  end

  def score
    url = "https://wagon-dictionary.herokuapp.com/#{params[:word]}"
    response = URI.open(url).read
    json = JSON.parse(response)
    if json['found']
      @message = "Good Job !"
    end
  end
end
