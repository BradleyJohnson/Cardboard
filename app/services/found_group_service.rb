class FoundGroupService
  def initialize(group, user)
    puts "INITIALIZING"
    @user_id = user.id,
    @group_id = group.id
  end

  def found
    puts "FOUNDING"
    puts @user_id
    puts @group_id
    Membership.create!(
      user_id: @user_id,
      group_id: @group_id,
      is_admin: true,
      is_founder: true
      )
  end
end
