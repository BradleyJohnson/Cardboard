require 'rails_helper'

feature Devise::SessionsController do

  before :each do
    visit root_path
    click_on "Sign up"
    fill_in "Username", with: "Falcon9"
    fill_in "Email", with: "falcon@spacex.com"
    fill_in "Password", with: "12345678"
    fill_in "Password confirmation", with: "12345678"
    click_on "Sign up"
    click_on "log out"
  end

  scenario "Previously registered user can log in" do
    expect(page).to have_content("Log in")

    fill_in "Email", with: "falcon@spacex.com"
    fill_in "Password", with: "12345678"
    click_on "Log in"

    expect(page).to have_content("Signed in successfully.")
    expect(page).to have_content("Falcon9")
  end

  scenario "User cannot log in with unmatched or non-existing credentials" do
    expect(page).to have_content("Log in")

    fill_in "Email", with: "falcon@spacex.com"
    fill_in "Password", with: "87654321"
    click_on "Log in"

    expect(page).to have_content("Invalid email or password.")
  end

end
