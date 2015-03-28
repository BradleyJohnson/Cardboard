class MeetupsController < ApplicationController
  def create
    @meetup = Meetup.new(meetup_params)
    @meetup.save
    binding.pry
    redirect_to group_path(params[:meetup][:group_id])
  end

  def show

  end



  private

  def meetup_params
    params.require(:meetup).permit(:group_id, :location_string, :location_address, :meetup_notes, :start_time, :end_time, :meetup_date)
  end
end
