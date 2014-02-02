FactoryGirl.define do
  factory :image do
    file  File.open('spec/features/fixtures/test.jpeg')
  end
end
