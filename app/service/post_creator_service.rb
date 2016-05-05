class PostCreatorService
	include ActiveModel::Validations

	attr_reader :post

	validate :validate_post

	def initialize(action, post_params)
		@post = Post.new(post_params)
		@post.published_state = set_published_state(action)
	end

	def submit
		if valid?
			@post.save
		else
			false
		end
	end

	private

	def set_published_state(action)
		case action
		when 'Publish' then :published
		when 'Save draught' then :draught
		when 'Delayed publishing' then :delayed_publishing
		else :draught
		end
	end

	def validate_post
		unless @post.valid?
			self.errors.add(:base, @post.errors)
		end
	end
end