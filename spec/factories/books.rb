
FactoryGirl.define do
  factory :book do
    sequence(:title) { |n| "#{n}cool book"}
    author "Fahad M"
    year 2008
    description "This book is one of a kind"
    category "Comics"
  end
end
