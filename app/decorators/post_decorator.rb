class PostDecorator < Draper::Decorator
	delegate_all

	def full_post_name
		"##{id} #{name}"
	end
end