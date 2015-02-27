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
    @group = Group.new(group_params)
    @group.save
    redirect_to groups_path
  end

  def show
    @group = Group.find(params[:id])
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end
end
