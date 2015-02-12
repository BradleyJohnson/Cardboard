require 'rails_helper'

feature RegistrationsController do

  before :each do
    visit root_path
    click_on "Sign up"
    fill_in "Username", with: "TreeFiddy"
    fill_in "Email", with: "you@got.com"
    fill_in "Password", with: "12345678"
    fill_in "Password confirmation", with: "12345678"
    click_on "Sign up"
    click_on "log out"
    click_on "Sign up"
  end

  scenario "Redirects to root after successful registration" do
    fill_in "Username", with: "Falcon9"
    fill_in "Email", with: "falcon@spacex.com"
    fill_in "Password", with: "12345678"
    fill_in "Password confirmation", with: "12345678"
    click_on "Sign up"

    expect(page).to have_content("Falcon9")
    expect(page).to have_content("falcon@spacex.com")
  end

  scenario "Registration error is displayed with bad parameters" do
    fill_in "Username", with: "Falcon9"
    fill_in "Email", with: "falcon@spacex.com"
    fill_in "Password", with: "87654321"
    fill_in "Password confirmation", with: "12345678"
    click_on "Sign up"

    expect(page).to have_content("Password confirmation doesn't match Password")
  end

  scenario "User cannot register with an existing email" do
    fill_in "Username", with: "TreeFiddy"
    fill_in "Email", with: "someotheremail@got.com"
    fill_in "Password", with: "12345678"
    fill_in "Password confirmation", with: "12345678"
    click_on "Sign up"

    expect(page).to have_content("Username has already been taken")
  end

  scenario "User cannot register with an existing username" do
    fill_in "Username", with: "SomeOtherUserName"
    fill_in "Email", with: "you@got.com"
    fill_in "Password", with: "12345678"
    fill_in "Password confirmation", with: "12345678"
    click_on "Sign up"

    expect(page).to have_content("Email has already been taken")
  end

end
