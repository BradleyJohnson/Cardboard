class AdminUserSearchService
  def initialize(group, query)
    @group_id = group
    @query = query
  end

  def call
    @users = Group.find(@group_id).users
    result_set = @users.select do |user|
      user.username.include?("#{@query}")
    end
    result_set
  end
end
