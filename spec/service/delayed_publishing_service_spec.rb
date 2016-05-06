require 'spec_helper'

describe DelayedPublishingService do
  let!(:post){ create(:post, published_state: published_state) }

  subject{ DelayedPublishingService.new }

  before{ subject.publish }

  context 'draught_post' do
    let(:published_state){ 'draught' }

    it 'should not change post published_state' do
      expect(post.reload.published_state).to eq(published_state)
    end
  end

  context 'delayed post' do
  	let!(:post){ create(:post, published_state: 'delayed_publishing', publish_time: Date.today) }
    let!(:tomorrow_publishing_post){ create(:post, published_state: 'delayed_publishing', publish_time: Date.today + 1.day) }

    it 'should change today post published_state' do
      expect(post.reload.published_state).to eq('published')
    end

    it 'should change tomorrow post published_state' do
      expect(tomorrow_publishing_post.reload.published_state).to eq('delayed_publishing')
    end
  end

  context 'post is published' do
    let(:published_state){ 'published' }

    it 'should not change post published_state' do
      expect(post.reload.published_state).to eq('published')
    end
  end
end