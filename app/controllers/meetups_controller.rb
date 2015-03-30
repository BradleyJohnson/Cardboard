class MeetupsController < ApplicationController
  def create
    @meetup = Meetup.new(meetup_params)
    @meetup.save
    redirect_to group_path(params[:meetup][:group_id])
  end

  def show
    @meetup = Meetup.find(params[:id])
    @attendees = User.joins(:rsvps).where(rsvps: { meetup_id: @meetup.id})
    @collections = []

    @attendees.each do |user|
      user.games.each do |game|
        @collections.push(game)
      end
    end
  end



  private

  def meetup_params
    params.require(:meetup).permit(:group_id, :location_string, :location_address, :meetup_notes, :start_time, :end_time, :meetup_date)
  end
end
