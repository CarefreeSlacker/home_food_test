class Category < ActiveRecord::Base
	validates :name, length: { minimum: 3 }

	has_many :category_posts
	has_many :posts, through: :category_posts
end
