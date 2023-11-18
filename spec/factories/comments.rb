FactoryBot.define do
  factory :comment do
    comment { "testcomment" } 
    association :user
    association :post
  end
end
