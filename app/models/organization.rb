class Organization < ActiveRecord::Base
  attr_accessible :hashtag

  has_many :events, dependent: :destroy

  validates :name, presence: true

  before_save :set_hashtag

  def tweets
    Tweet.where("text ilike ?", "%##{hashtag}%")
  end

  def update_tweets!
    Twitter::Client.new.search("##{hashtag}", rpp: 100).results.each do |result|
      twitter_user = TwitterUser.find_or_initialize_by_external_id(result.from_user_id)
      twitter_user.username = result.from_user
      twitter_user.name = result.from_user_name
      twitter_user.profile_image_url = result.profile_image_url

      tweet = Tweet.find_or_initialize_by_external_id(result.id)
      tweet.twitter_user = twitter_user
      tweet.text = result.text
      tweet.created_at = result.created_at
      tweet.updated_at = result.created_at

      tweet.save
    end

    rescue nil
  end

  private

  def set_hashtag
    self.hashtag = name.gsub(/\W/, '') unless hashtag?
  end
end
