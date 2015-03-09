require 'rails_helper'

feature "Admin page" do
  before :each do
    visit root_path
    click_on "Sign up"
    fill_in "Username", with: "TreeFiddy"
    fill_in "Email", with: "you@got.com"
    fill_in "Password", with: "12345678"
    fill_in "Password confirmation", with: "12345678"
    click_on "Sign up"

    click_on "Groups"
    click_on "Found a Group"

    fill_in "Name", with: "Redwood City Board Games Meetup"
    click_on "Create Group"
  end

  scenario "Administrator has access to Admin panel" do
    click_on "View Group"
    click_on "Admin"

    expect(page).to have_content("Admin Page for Redwood City Board Games Meetup")
  end

  # scenario "Can see list of admins from admin panel" do
  #
  # end

end
