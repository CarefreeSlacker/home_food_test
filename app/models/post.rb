class Post < ActiveRecord::Base
	validates :name , length: { minimum: 5 }
	validates :text, length: { minimum: 1, maximum: 300 }

	state_machine :published_state, initial: :draught do
		state :draught
		state :published
		state :delayed_publishing

		event :publish do
			transition all => :published	
		end

		event :delay_publish do
			transition draught: :delayed_publishing
		end
	end
end
