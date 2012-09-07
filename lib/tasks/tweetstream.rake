if defined?(Rails) && (Rails.env == 'development')
  Rails.logger = Logger.new(STDOUT)
end

namespace :tweetstream do
  desc "Stream tweets"
  task :stream => :environment do
    TweetStream::Client.new.on_error do |message|
      Rails.logger.info "TweetStream error: #{message}"
    end.on_reconnect do |timeout, retries|
      Rails.logger.info "TweetStream timeout: #{timeout}, #{retries}"
    end.track(Organization.hashtags) do |status|
      Rails.logger.info "TweetStream tweet: #{status.text}"

      twitter_user = TwitterUser.find_or_initialize_by_external_id(status.user.id)
      twitter_user.username = status.user.screen_name
      twitter_user.name = status.user.name
      twitter_user.profile_image_url = status.user.profile_image_url

      tweet = Tweet.find_or_initialize_by_external_id(status.id)
      tweet.twitter_user = twitter_user
      tweet.text = status.text
      tweet.created_at = status.created_at
      tweet.updated_at = status.created_at

      tweet.save
    end
  end
end