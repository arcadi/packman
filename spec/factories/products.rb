FactoryGirl.define do
  factory :product do
    sequence(:number) { |n| "111-#{n}-222" }
    sequence(:name) { |n| "name #{n}" }
    width 1
    height 1
    depth 1
    weight 1
    stock_level 1
  end
end
