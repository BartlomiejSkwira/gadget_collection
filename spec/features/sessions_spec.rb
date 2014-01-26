require_relative '../spec_helper'

feature "User sessions" do
  background do
    @user = create :user
  end

  scenario "Signing in with correct credentials" do
    visit root_path
    click_link 'Login'
    within("#session") do
      fill_in 'Login', :with => 'user@example.com'
      fill_in 'Password', :with => 'applift'
    end
    click_link 'Sign in'
    expect(page).to have_content 'Signed in successfully'
  end

  scenario "Signing out with correct credentials" do
    visit new_session_path
    within("#session") do
      fill_in 'Login', :with => 'user@example.com'
      fill_in 'Password', :with => 'applift'
    end
    click_link 'Sign in'
    click_link 'Sign out'
    expect(page).to have_content 'Signed out successfully'
  end

end
