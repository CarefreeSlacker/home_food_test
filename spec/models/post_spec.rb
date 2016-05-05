require 'spec_helper'

describe Post, type: :model do
	describe 'validations' do
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

	describe '#visible' do
		let!(:published_post){ create(:post, published_state: 'published') }
		let!(:unpublished_post){ create(:post) }
		let!(:delayed_post){ create(:post, published_state: 'delayed_publishing', publish_date: Date.today + 2.days) }
		subject{ Post.visible }

		it 'should return only published_posts' do
			expect(subject.pluck(:id)).to eq([published_post.id])
		end
	end
end