class MembershipsController < ApplicationController
  def create
    @membership = Membership.new(user_id: current_user.id, group_id: params[:group_id])
    @membership.save
    redirect_to group_path(params[:group_id])
  end

  private

  # def membership_params
  #   params.require(:group).permit(:id)
  # end
end
