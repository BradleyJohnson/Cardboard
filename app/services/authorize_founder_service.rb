class AuthorizeFounderService
  def initialize(group, applicant)
    @group_id = group
    @user_id = applicant
  end

  def call
    if Membership.find_by(user_id: @user_id, group_id: @group_id, is_founder: true) == nil
      false
    else
      true
    end
  end
end
