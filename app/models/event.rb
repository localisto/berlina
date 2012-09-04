class Event < ActiveRecord::Base
  validates :external_id, presence: true, uniqueness: true
  validates :name, presence: true
  validates :start_time, presence: true

  def geocoded?
    lat? && lng?
  end
end
