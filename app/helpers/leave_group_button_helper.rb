module LeaveGroupButtonHelper
  def render_leave_button
    return link_to 'Leave Group',  memberships_path({membership: @membership}),  method: :delete, data: { confirm: 'Are you sure?' }, class: "btn btn-danger outline" if @membership
  end
end
