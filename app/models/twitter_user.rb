class TwitterUser < ActiveRecord::Base
  validates :external_id, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :name, presence: true
  validates :profile_image_url, presence: true
end
