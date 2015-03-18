class SearchController < ApplicationController
  def users
    @users = AdminUserSearchService.new(params[:group], params[:userQuery]).call
    render json: @users
  end
end
