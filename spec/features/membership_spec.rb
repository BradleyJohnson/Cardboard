require 'rails_helper'

feature MembershipsController do
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

  scenario "Users should be added to group autmatically after founding group." do
    expect(page).to have_content("Your Groups")
    expect(page).to have_content("Redwood City Board Games Meetup")
  end

  scenario "Users can join a group if they are logged in" do
    click_on "Log Out"
    click_on "Sign up"
    fill_in "Username", with: "JimboSlice"
    fill_in "Email", with: "polygon@grifter.com"
    fill_in "Password", with: "12345678"
    fill_in "Password confirmation", with: "12345678"
    click_on "Sign up"
    click_on "Find a Group"

    expect(page).to have_content("Redwood City Board Games Meetup")

    click_on "View Group"
    click_on "Join this group"

    expect(page).to have_content("Successfully joined group")
  end


  scenario "Users can leave a group" do
    expect(page).to have_content("Your Groups")
    expect(page).to have_content("Redwood City Board Games Meetup")
    click_on "View Group"
    click_on "Leave Group"

    expect(page).to have_content("Your Groups")
    expect(page).to have_no_content("Redwood City Board Games Meetup")
  end

  xscenario "Founder can remove non-admin user from a Group"
  xscenario "Admin can remove non-admin user from a Group"
  xscenario "Founder can remove other Admin from a Group"
  xscenario "Admin cannot remove other Admin from a Group"
  xscenario "Admin cannot remove Founder from a Group"
  xscenario "Admin can add Admin status to a User"
  xscenario "Admin can remove Admin status to a User"
  xscenario "Normal User cannot create an Admin"
  xscenario "Normal User cannot remove an Admin"


end
