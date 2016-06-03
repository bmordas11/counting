FactoryGirl.define do
  factory :receipt do
    sequence(:title) { |n| "#{n} Pineapples Bought" }
    date "2-15-2016"
    sequence(:amount) { |n| 25_111.31 + n }
    created_at "3-3-2016"
    updated_at "3-3-2016"
  end
end
