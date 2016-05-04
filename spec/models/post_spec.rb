require 'spec_helper'

describe Post, type: :model do
	it 'should be valid' do
		post = build(:post)
		expect(post).to be_valid
	end

	it 'validates length of name' do
		post =  build(:post, name: 'a')
		expect(post).not_to be_valid
	end

	it 'validates length of text' do
		post = build(:post, text: 'a'*301)
		expect(post).not_to be_valid
	end
end