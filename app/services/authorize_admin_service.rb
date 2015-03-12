class AuthorizeAdminService
  def initialize(group, applicant)
    @group_id = group
    @user_id = applicant
  end

  def call
    Membership.find_by(user_id: @user_id, group_id: @group_id, is_admin: true)
  end
end
