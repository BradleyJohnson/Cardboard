require 'rails_helper'

feature RegistrationsController do

  scenario "Redirects to Profile after successful registration" do
    visit root_path
    click_on "Or, Sign up"

    fill_in "username-input", with: "Falcon9"
    fill_in "email-input", with: "falcon@spacex.com"
    fill_in "password-input", with: "12345678"
    fill_in "password-confirmation-input", with: "12345678"
    click_on "Sign up"

    expect(page).to have_content("Dashboard")
  end

  scenario "Registration error is displayed with bad credentials" do
    visit root_path

    fill_in "email-input", with: "falcon@spacex.com"
    fill_in "password-input", with: "87654321"
    click_on "Log in"

    expect(page).to have_content("Invalid email or password.")
  end

  scenario "User cannot register with an existing email" do
    User.create!(username: "TheDude", email: "you@got.com", password: "12345678")
    visit root_path
    click_on "Or, Sign up"

    fill_in "username-input", with: "Falcon9"
    fill_in "email-input", with: "you@got.com"
    fill_in "password-input", with: "12345678"
    fill_in "password-confirmation-input", with: "12345678"
    click_on "Sign up"

    expect(page).to have_content("Email has already been taken")
  end

  scenario "User cannot register with an existing username" do
    User.create!(username: "TreeFiddy", email: "you@got.com", password: "12345678")
    visit root_path
    click_on "Or, Sign up"
    
    fill_in "username-input", with: "TreeFiddy"
    fill_in "email-input", with: "you@got.com"
    fill_in "password-input", with: "12345678"
    fill_in "password-confirmation-input", with: "12345678"
    click_on "Sign up"

    expect(page).to have_content("Username has already been taken")
  end

end
