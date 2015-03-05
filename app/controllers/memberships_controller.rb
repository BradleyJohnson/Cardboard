class MembershipsController < ApplicationController
  def create
    @membership = Membership.new(user_id: current_user.id, group_id: params[:group_id])
    @membership.save
    if @membership
      redirect_to groups_path, notice: "Successfully joined group"
    end
  end

  def destroy
    @membership = Membership.find(params[:membership])
    if @membership.destroy
      redirect_to groups_path, notice: "Successfully left group"
    else
      render :show
    end
  end

  private

  def membership_params
    # params.require(:group).permit(:id)
    # params.require(:group).permit!
  end
end
