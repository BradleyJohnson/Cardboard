class MembershipsController < ApplicationController
  before_action :authorize_founder, only: [:update]

  def create
    @membership = Membership.new(user_id: current_user.id, group_id: params[:group_id])
    if @membership.save
      redirect_to groups_path, notice: "Successfully joined group"
    else
      # Validate for banhammer
    end
  end

  def destroy
    if params.has_key?("membership")
      Membership.find(params[:membership]).destroy
      redirect_to groups_path, notice: "Successfully left group"
    else
      Membership.find_by(group_id: params[:group_id], user_id: params[:user_id]).destroy
      flash.now[:notice] = "Successfully booted user from group"
    end
  end

  def update
    if params.has_key?("admin")
      ToggleAdminService.new(params).call
      render :js => "window.location = '/groups/#{params[:group_id]}/admin'", notice: "Successfully toggled admin"
    else
      #
    end
  end


private
  def authorize_founder
    authorized = AuthorizeFounderService.new(params[:group_id], current_user.id).call
    if !authorized
      render text: "You are not authorized to do this", status: :unauthorized
    end
  end
end
