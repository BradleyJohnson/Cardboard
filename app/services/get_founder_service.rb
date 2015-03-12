class GetFounderService
  def initialize(group)
    @group_id = group
  end

  def call
    founder_id = Membership.find_by(group_id: @group_id, is_founder: true).user_id
    User.find(founder_id).username
  end
end
