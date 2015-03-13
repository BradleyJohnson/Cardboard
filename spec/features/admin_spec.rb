require 'rails_helper'

feature "Admin page" do
  before :each do
    new_group = Group.create(name: "Black Rebel Board Game Club")
    bob = User.create(username: "bob", email: "bob@bob.com", password: "12345678")
    ted = User.create(username: "ted", email: "ted@ted.com", password: "12345678")
    ned = User.create(username: "ned", email: "ned@ned.com", password: "12345678")
    brad = User.create(username: "brad", email: "ed@brad.com", password: "12345678")
    Membership.create(user_id: bob.id, group_id: new_group.id, is_admin: true, is_founder: true)
    Membership.create(user_id: ted.id, group_id: new_group.id, is_admin: true, is_founder: false)
    Membership.create(user_id: ned.id, group_id: new_group.id, is_admin: false, is_founder: false)
    Membership.create(user_id: brad.id, group_id: new_group.id, is_admin: false, is_founder: false)

    log_in(bob, "12345678")
    go_to_admin
  end

  scenario "Administrator has access to Admin panel" do
    expect(page).to have_content("Admin Page for Black Rebel Board Game Club")
  end

  scenario "Admin panel lists the founder" do
    expect(page).to have_content("Founder: bob")
  end

  scenario "Non-admin user cannot access admin page" do
    ned = User.find_by(username: "ned")
    group = Group.find_by(name: "Black Rebel Board Game Club")
    log_out
    log_in(ned, "12345678")
    visit "/groups/#{group.id}/admin"

    expect(page).to have_content("You are not authorized to view this page.")
  end

  scenario "User search from admin page works" do
    fill_in 'admin_user_search', with: "ed"
    click_on "Search"

    # expect(page).to have_content("ted@ted.com")
    # expect(page).to have_content("ned@ned.com")
    # expect(page).to have_content("ed@brad.com")
    expect(page).to have_selector("list")
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
