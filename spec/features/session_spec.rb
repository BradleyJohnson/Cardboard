require 'rails_helper'

feature Devise::SessionsController do

  before :each do
    User.create!(username: "bob", email: "bob@bob.com", password: "12345678")
  end

  scenario "Previously registered user can log in" do
    visit root_path

    fill_in "email-input", with: "bob@bob.com"
    fill_in "password-input", with: "12345678"
    click_on "Log in"

    expect(page).to have_content("Signed in successfully.")
  end

  scenario "User cannot log in with unmatched or non-existing credentials" do
    visit root_path

    fill_in "email-input", with: "falcon@spacex.com"
    fill_in "password-input", with: "87654321"
    click_on "Log in"

    expect(page).to have_content("Invalid email or password.")
  end

end
