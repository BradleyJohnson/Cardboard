module ApplicationHelper

  def medium_img_url(url)
    # "http:" + url.sub!("_t", "_sq")
    url
  end

  def has_unread?
    if Message.where(recipient_username: current_user.username, unread: true ).count > 0
      " has-unread"
    end
  end

  def collection_active
    if controller_name == 'collections' && action_name == 'index'
      "active"
    else
      nil
    end
  end

  def inbox_active
    if controller_name == 'messages' && action_name == 'index'
      "active"
    else
      nil
    end
  end

  def group_active
    if controller_name == 'groups'
      "active"
    else
      nil
    end
  end

  def account_active
    if controller_name == 'account'
      "active"
    else
      nil
    end
  end

end
