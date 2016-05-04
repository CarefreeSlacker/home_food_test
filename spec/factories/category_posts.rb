FactoryGirl.define do
  factory :category_post do
    association :category, factory: :category
    association :post, factory: :post
  end
end
