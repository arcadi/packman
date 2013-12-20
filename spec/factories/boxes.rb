FactoryGirl.define do
  factory :box do
    sequence(:name) { |n| "box #{n}" }
    volume 10
  end
end
