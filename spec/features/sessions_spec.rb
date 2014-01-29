require_relative '../spec_helper'

feature "User sessions,
as a user,
I can" do
  background do
    @user = create :user
  end

  scenario "sign in with correct credentials" do
    visit root_path
    click_link 'Login'
    within("#session") do
      fill_in 'Email', :with => 'user@example.com'
      fill_in 'Password', :with => 'applift'
    end
    click_on 'Sign in'
    expect(page).to have_content @user.email
  end

  scenario "sign out" do
    sign_in_user @user
    click_link 'Sign out'
    expect(page).not_to have_content @user.email
  end

end
