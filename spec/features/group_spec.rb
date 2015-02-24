require 'rails_helper'

feature GroupsController do
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

  scenario "Users can create a group" do
    click_on "Found a Group"

    fill_in "Name", with: "Bay Area Tabletop Guild"
    click_on "Create Group"

    expect(page).to have_content("Bay Area Tabletop Guild")
  end

  scenario "Users can join a group if they are logged in" do
    click_on "Log Out"
    click_on "Sign up"
    fill_in "Username", with: "JimboSlice"
    fill_in "Email", with: "polygon@grifter.com"
    fill_in "Password", with: "12345678"
    fill_in "Password confirmation", with: "12345678"
    click_on "Sign up"
    click_on "Groups"
    click_on "Join a group"

    expect(page).to have_content("Redwood City Board Games Meetup")

    click_on "Redwood City Board Games Meetup"
    click_on "Join group"

    within(:css, "ul#my-groups") do
      expect(page).to have_content("Redwood City Board Games Meetup")
    end
  end

  xscenario "Users cannot join a group if they are not logged in" do
    visit groups_path
    click_on "Redwood City Board Games Meetup"
    click_on "Join group"

    expect(page).to have_content("You must be signed in to join a group")
  end

  xscenario "Users can leave a group" do
    click_on "Log Out"
    click_on "Sign up"
    fill_in "Username", with: "JimboSlice"
    fill_in "Email", with: "polygon@grifter.com"
    fill_in "Password", with: "12345678"
    fill_in "Password confirmation", with: "12345678"
    click_on "Sign up"
    click_on "Groups"
    click_on "Join a group"

    expect(page).to have_content("Redwood City Board Games Meetup")
    click_on "Redwood City Board Games Meetup"
    click_on "Join group"

    within(:css, "ul#my-groups") do
      click_on "Redwood City Board Games Meetup"
    end

    click_on "Leave group"

    within(:css, "ul#my-groups") do
      expect(page).to have_no_content("Redwood City Board Games Meetup")
    end
  end

  xscenario "Users can only see groups they belong to" do
    click_on "Found a Group"

    fill_in "Name", with: "Bay Area Tabletop Guild"
    click_on "Create Group"

    expect(page).to have_content("Bay Area Tabletop Guild")
  end

  xscenario "Users can be removed from a group"

end
