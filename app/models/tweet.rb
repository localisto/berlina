class Tweet < ActiveRecord::Base
  belongs_to :twitter_user

  validates :external_id, presence: true, uniqueness: true
  validates :text, presence: true
  validates :twitter_user, presence: true

  delegate :name, :username, :profile_image_url, to: :twitter_user
end
