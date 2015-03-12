require 'rails_helper'

feature "Admin page" do
  before :each do
    bob = User.create(username: "bob", email: "bob@bob.com", password: "12345678")
    ted = User.create(username: "ted", email: "ted@ted.com", password: "12345678")
    new_group = Group.create(name: "Black Rebel Board Game Club")
    Membership.create(user_id: bob.id, group_id: new_group.id, is_admin: true, is_founder: true)
    Membership.create(user_id: ted.id, group_id: new_group.id, is_admin: false, is_founder: false)

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
    ted = User.find_by(username: "ted")
    group = Group.find_by(name: "Black Rebel Board Game Club")
    log_out
    log_in(ted, "12345678")
    visit "/groups/#{group.id}/admin"

    expect(page).to have_content("You are not authorized to view this page.")
  end

end
