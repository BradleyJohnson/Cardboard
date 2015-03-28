class GroupsController < ApplicationController
  def index
    @groups = User.find(current_user.id).groups
  end

  def all
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    founded_group = FoundGroupService.new(group_params[:name], current_user.id).found

    if founded_group
      redirect_to groups_path
    else

    end
  end

  def show
    @group = Group.find(params[:id])
    @membership = Membership.find_by(group_id: @group.id, user_id: current_user.id)
    @meetups = @group.meetups
  end


  private
  def group_params
    params.require(:group).permit(:name)
  end
end
