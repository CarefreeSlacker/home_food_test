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
		let(:user){ create(:user) }
		let!(:published_post){ create(:post, published_state: 'published', user: user) }
		let!(:unpublished_post){ create(:post, user: user) }
		let!(:delayed_post){ create(:post, published_state: 'delayed_publishing', publish_time: Time.zone.now + 2.days, user: user) }

		context 'user looks his own posts' do
		  it 'see all posts' do
		   	expect(Post.visible(user).pluck(:id).sort).to eq([published_post.id, unpublished_post.id, delayed_post.id].sort)
		  end
		end

		context 'user looks other user posts' do
		  let(:other_user){ create(:user) }

		  it 'see only published_post' do
		    expect(Post.visible(other_user).pluck(:id)).to eq([published_post.id])
		  end
		end
	end
end