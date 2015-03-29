class FoundGroupService

  def initialize(group_params, user_id)
    @group_params = group_params
    @user_id = user_id
  end

  def found
    @new_group = Group.create!(name: @group_params[:name], location: @group_params[:location], description: @group_params[:description])
    Membership.create!(
      user_id: @user_id,
      group_id: @new_group.id,
      is_admin: true,
      is_founder: true
      )
  end
end
