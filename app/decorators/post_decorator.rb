class PostDecorator < Draper::Decorator
	delegate_all

	def full_post_name
	  "##{id} #{name}"
	end

	def status
	  post_status = status_class_and_text	
      "<span class=#{post_status[:class]}>#{post_status[:text]}</span>".html_safe
	end

	def post_text
	  if text.length == 300 && text[-1] != '.'
	  	text + '.'
	  else
	  	text
	  end
	end

	def categories_list
	  "Категории: #{ post.categories.any? ? post.categories.map(&:name).join(', ') : 'Нет' }"
	end

	private

	def status_class_and_text
		return { class: '', text: '' } if published_state == 'published'
		# I18n.l(publish_date, format: '%B %m')
		status_text = published_state == 'draught' ? 'Черновик' : "Будет опубликован: #{publish_time}"
		return { class: published_state, text: status_text }
	end
end