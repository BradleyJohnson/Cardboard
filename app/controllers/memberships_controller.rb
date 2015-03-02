class MembershipsController < ApplicationController
  def create
    @membership = Membership.new(user_id: current_user.id, group_id: params[:group_id])
    @membership.save
    redirect_to root_path
  end

  private

  def membership_params
    # params.require(:group).permit(:id)
    # params.require(:group).permit!
  end
end
