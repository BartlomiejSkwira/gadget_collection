FactoryGirl.define do
  factory :gadget do
    sequence(:name) { |i| "Gadget #{i}" }
  end
end
