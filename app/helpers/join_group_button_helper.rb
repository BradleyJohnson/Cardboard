module JoinGroupButtonHelper
  def render_join_button
    return link_to "Join", {:controller => "memberships", :action => "create", :group_id => @group.id }, class: "btn btn-primary outline" if !@membership
  end
end
