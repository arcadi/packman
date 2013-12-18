# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
    number "MyString"
    name "MyString"
    width 1.5
    height 1.5
    depth 1.5
    weight 1.5
    stock_level 1
  end
end
