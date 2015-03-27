module ApplicationHelper

  def returns_current_page_header
    if controller_name == 'collections' && action_name == 'index'
      current_user.username + "'s Collection"
    elsif controller_name == 'messages' && action_name == 'index'
      "Inbox"
    elsif controller_name == 'groups' && action_name == 'all'
      "Find a Group"
    elsif controller_name == 'groups' && action_name == 'index'
      "Your Groups"
    elsif controller_name == 'groups' && action_name == 'show'
      @group.name
    elsif controller_name == 'groups' && action_name == 'new'
      "New Group"
    elsif controller_name == 'account'
      "Account"
    elsif controller_name == 'admin'
      "Admin Panel"
    end
  end

  def medium_img_url(url)
    # "http:" + url.sub!("_t", "_sq")
    url
  end

  def has_unread?
    if current_user
      if Message.where(recipient_username: current_user.username, unread: true ).count > 0
        " has-unread"
      end
    end
  end

  def collection_active
    if controller_name == 'collections' && action_name == 'index'
      "active"
    else
      nil
    end
  end

  def profile_active
    if controller_name == 'profiles' && action_name == 'index'
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
