class FoundGroupService

  def initialize(group, user_id)
    @group_name = group
    @user_id = user_id
  end

  def found
    @new_group = Group.create!(name: @group_name)
    Membership.create!(
      user_id: @user_id,
      group_id: @new_group.id,
      is_admin: true,
      is_founder: true
      )
  end
end
