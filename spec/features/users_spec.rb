require_relative '../spec_helper'

feature "Users" do

  scenario "Create a new user" do
    visit new_user_path
    expect {
      within("#user") do
        fill_in 'Email', :with => 'user@example.com'
        fill_in 'Password', :with => 'applift'
        fill_in 'Password confirmation', :with => 'applift'
      end
      click_link 'Sign up'
    }.to change{User.count}.by(1)
    expect(page).to have_content 'Account successfully created'
  end
end
