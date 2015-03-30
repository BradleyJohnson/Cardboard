class RsvpsController < ApplicationController
  def create
    @rsvp = Rsvp.new(rsvp_params)

    if @rsvp.save
      redirect_to meetup_path(params[:rsvp][:meetup_id]), notice: "Successful RSVP"
    else
      redirect_to meetup_path(params[:rsvp][:meetup_id]), notice: "There was an error, please try again"
    end
  end


  private

    def rsvp_params
      params.require(:rsvp).permit(:user_id, :meetup_id)
    end
end
