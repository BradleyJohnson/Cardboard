class ResultsController < ApplicationController
  def create
    puts "$" * 40
    puts result_params
    puts "$" * 40

    @result = Result.new(result_params)
    @result.save
    redirect_to meetup_path(result_params[:meetup_id]), notice: "Successfully logged"
  end

  private

  def result_params
    params.require(:result).permit(:user_id, :game_id, :result, :meetup_id)
  end
end
