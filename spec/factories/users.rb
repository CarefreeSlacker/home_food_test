FactoryGirl.define do
  factory :user do
    first_name { |n| "first_name#{n}" }    
    last_name { |n| "last_name#{n}" }    
    date_of_birth Date.today - 18.years  
    email { |n| "examle_email#{n}@gmail.com" } 
    password 123123
  end
end
