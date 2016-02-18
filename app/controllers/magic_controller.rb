class MagicController < ApplicationController
  def magic8ball
    answerArray = ["Yup!","Fuhgeddaboudit", "Maybe", "Ask: what would your mother do?", "Ask: what would an Australian do, then do the opposite", "Your answer here"]

    if !params[:input].nil?
      num = Random.new
      a = num.rand(answerArray.length+1)
      flash.now[:alert] = answerArray[a]
    end
  end
end
