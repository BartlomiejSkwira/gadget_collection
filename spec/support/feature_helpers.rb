def sign_in(user = create(:user))
  visit new_session_path
  within("#session") do
    fill_in 'Email', :with => 'user@example.com'
    fill_in 'Password', :with => 'applift'
  end
  click_on 'Sign in'
end
