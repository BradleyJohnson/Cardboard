class AdminController < ApplicationController
before_action :authorize_admin, only: [:show]

def show
  @group = Group.find(params[:id])
  @founder = @group.founder
  @administrators = @group.admin
end


private
  def authorize_admin
    authorized = AuthorizeAdminService.new(params[:id], current_user.id).call
    if !authorized
      redirect_to groups_path, notice: "You are not authorized to view this page."
    end
  end

end
