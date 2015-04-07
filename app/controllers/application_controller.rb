class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :get_inbox_count, :authenticate_user!

  def after_sign_in_path_for(current_user)
    user_path(current_user)
  end

  def get_inbox_count
    if current_user
      @message_count = Message.where(recipient_username: current_user.username, unread: true ).count
    end
  end

end
