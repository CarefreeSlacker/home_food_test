FactoryGirl.define do
  factory :category do
	name { |n| "Random sting #{n}" }  
  end
end
