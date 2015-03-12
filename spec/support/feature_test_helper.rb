module FeatureTestHelper
  def log_in(user, pass)
    visit root_path
    fill_in "Email", with: user.email
    fill_in "Password", with: pass
    click_on "Log in"
  end

  def log_out
    click_on "Log Out"
  end

  def go_to_admin
    click_on "Groups"
    click_on "My Groups"
    click_on "View Group"
    click_on "Admin"
  end
end

RSpec.configure do |config|
  config.include FeatureTestHelper, :type => :feature
end
