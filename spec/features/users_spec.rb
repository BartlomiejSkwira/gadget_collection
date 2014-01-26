require_relative '../spec_helper'

feature "Users" do

  scenario "Create a new user" do
    visit new_user_path
    expect {
      within("#user") do
        fill_in 'Email', :with => 'user@example.com'
        fill_in 'Password', :with => 'applift'
        fill_in 'Password confirmation', :with => 'applift'
        click_on 'Sign up'
      end
    }.to change{User.count}.by(1)
    expect(page).to have_content User.last.email
  end
end
