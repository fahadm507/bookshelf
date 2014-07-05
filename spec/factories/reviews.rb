FactoryGirl.define do
  factory :review do
    sequence(:body) { |n| "#{n}i like it"}
    rating 2
    book
  end
end
