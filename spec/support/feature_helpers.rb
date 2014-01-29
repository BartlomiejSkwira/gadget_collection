def sign_in_user(user = create(:user))
  visit new_session_path
  within("#session") do
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => 'applift'
  end
  click_on 'Sign in'
end
