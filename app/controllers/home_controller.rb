class HomeController < ApplicationController
  def homepage
    cookies[:player] = " "
    # render homepage
    if params.has_key?(:player) && !params[:player].strip.empty?
      cookies[:player] = params[:player]
    end
    @player = cookies[:player].capitalize
  end
end
