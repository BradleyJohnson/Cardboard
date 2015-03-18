class ToggleAdminService
  def initialize(params)
    @group_id = params[:group_id]
    @user_id = params[:user_id]
  end

  def call
    membership = Membership.find_by(group_id: @group_id, user_id: @user_id)
    is_admin = membership.is_admin

    if is_admin
      membership.update(is_admin: false)
      membership.save
    else
      membership.update(is_admin: true)
      membership.save
    end

  end
end
