class GameController < ApplicationController
  def try
    # this will render try.html.erb in views folder after everything in the method has been executed.


    if cookies[:secret_number].nil?
      cookies[:secret_number] = Random.rand(100)
      cookies[:all_guess] = " "
    end


    @secret_number = cookies[:secret_number].to_i
    @guess = params[:guess].to_i


    if @guess < 100 && @guess > 0
      cookies[:all_guess] = cookies[:all_guess] + @guess.to_s + ", "
      if @secret_number == @guess
        flash.now[:notice] = "You win! Guess another number to play again!"
        cookies[:secret_number] = Random.rand(100)
        cookies[:all_guess] = " "
      elsif @secret_number > @guess
        flash.now[:alert] = "Too Low, guess again!"
      elsif @secret_number < @guess
        flash.now[:alert] = "Too High, guess again!"
      end
    else
      flash.now[:alert] = "Please enter a NUMBER between 1 and 100!"
    end


  end

end
