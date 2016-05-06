class DelayedPublishingService
  def publish
  	Post.where('posts.published_state = ? AND posts.publish_time < ?', 'delayed_publishing', Time.zone.now).map(&:publish)
  end
end