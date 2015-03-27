module AdminButtonHelper
  def render_admin_button
    return link_to "Admin", admin_path, class: "btn btn-primary btn-sm outline" if @membership && @membership.is_admin
  end
end
