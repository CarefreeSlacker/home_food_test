FactoryGirl.define do
	factory :post, class: Post do
		association :user, factory: :user
		name 'Enougn long name'
		text 'Test text'
		published_state 'draught'
	end
end