class Post < ActiveRecord::Base
	validates :name , length: { minimum: 5 }
	validates :text, length: { minimum: 1, maximum: 300 }
end
