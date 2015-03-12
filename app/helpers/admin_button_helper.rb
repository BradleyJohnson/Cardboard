module AdminButtonHelper
  def render_admin_button
    return link_to "Admin", admin_path, class: "btn btn-primary" if @membership && @membership.is_admin
  end
end
