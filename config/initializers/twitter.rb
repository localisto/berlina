if Rails.env.production?
  TweetStream.configure do |config|
    config.consumer_key = 'BjeKF7GpcOAOKBCdxrzwg'
    config.consumer_secret = 'YEjTkd58xR8uLXR2JGXY7BCVjx8JD2xqtGQEWeek0'
    config.oauth_token = '343688441-ws2ZARpYwPnNBI65OyaP3buJyv1pZi2M9WQ5SPNL'
    config.oauth_token_secret = '37yq679PNFLm69BEtf0bck43SzJvN0BJSqUmojG26c'
    config.auth_method = :oauth
  end
else
  unless ENV["TWITTER_USERNAME"].present? && ENV["TWITTER_PASSWORD"].present?
    raise "You need to export TWITTER_USERNAME and TWITTER_PASSWORD to use TweetStream outside of production"
  end
  TweetStream.configure do |config|
    config.username = ENV["TWITTER_USERNAME"]
    config.password = ENV["TWITTER_PASSWORD"]
    config.auth_method = :basic
  end
end