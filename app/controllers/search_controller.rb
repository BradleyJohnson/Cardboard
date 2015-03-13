class SearchController < ApplicationController
  def users
    q = params[:userQuery]
    group_id = params[:group]
    @users = User.where("username ILIKE ?", "%#{q}%")
    render json: @users
  end
end
