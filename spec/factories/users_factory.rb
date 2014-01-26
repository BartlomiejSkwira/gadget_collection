FactoryGirl.define do
  factory :user do
    email  "user@example.com"
    password 'applift'
    password_confirmation 'applift'
  end
end
