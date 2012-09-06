class Event < ActiveRecord::Base
  belongs_to :organization

  validates :organization, presence: true
  validates :external_id, presence: true, uniqueness: true
  validates :start_time, presence: true

  delegate :name, :hashtag, :tweets, :update_tweets!, to: :organization

  scope :future, lambda { where("start_time >= ?", Time.now) }
  scope :past, lambda { where("start_time < ?", Time.now) }

  def geocoded?
    lat? && lng?
  end
end
