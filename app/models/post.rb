class Post < ActiveRecord::Base
	validates :name , length: { minimum: 5 }
	validates :text, length: { minimum: 1, maximum: 300 }

	has_many :category_posts
	has_many :categories, through: :category_posts

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

	self.per_page = 20

	def self.visible
		all.where(published_state: 'published')
	end

	private

	def set_initial_state
		self.published_state ||= :draught
		self.publish_date ||= Date.today if self.published_state == 'published'
	end
end
