FactoryGirl.define do
	factory :post, class: Post do
		name 'Enougn long name'
		text 'Test text'
		publish_date Date.today
	end
end