class GroupsController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @groups = @user.groups
  end

  def all
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.create(group_params)
    @membership = Membership.create(
      user_id: current_user.id,
      group_id: @group.id,
      is_admin: true,
      is_founder: true
    )

    redirect_to groups_path
  end

  def show
    @group = Group.find(params[:id])
    @membership = Membership.find_by(group_id: @group.id, user_id: current_user.id)
  end

  private
  def group_params
    params.require(:group).permit(:name)
  end
end
