class Post < ActiveRecord::Base
	validates :name , length: { minimum: 5 }
	validates :text, length: { minimum: 1, maximum: 300 }

	after_initialize :set_initial_state

	state_machine :published_state, initial: :draught do
		state :published
		state :delayed_publishing

		event :publish do
			transition all => :published	
		end

		event :delay_publish do
			transition draught: :delayed_publishing
		end
	end

	self.per_page = 3 #TODO change this to 20 after the debug

	private

	def set_initial_state
		self.published_state ||= :draught
	end
end
