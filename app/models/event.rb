class Event < ActiveRecord::Base
  validates :external_id, presence: true, uniqueness: true
  validates :name, presence: true
  validates :start_time, presence: true

  before_save :set_hashtag

  def geocoded?
    lat? && lng?
  end

  private

  def set_hashtag
    self.hashtag = name.gsub(/\W/, '') unless hashtag?
  end
end
