class Event < ActiveRecord::Base
  belongs_to :organization

  validates :organization, presence: true
  validates :external_id, presence: true, uniqueness: true
  validates :start_time, presence: true

  delegate :name, :hashtag, :tweets, :update_tweets!, to: :organization

  def geocoded?
    lat? && lng?
  end
end
