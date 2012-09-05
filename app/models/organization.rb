class Organization < ActiveRecord::Base
  attr_accessible :category_id, :hashtag

  belongs_to :category
  has_many :events, dependent: :destroy

  validates :name, presence: true

  before_save :set_hashtag

  class << self
    def hashtags
      all.map { |organization| "##{organization.hashtag}" }
    end
  end

  def next_event
    events.where("start_time >= ?", Time.now).order("start_time").first
  end

  private

  def set_hashtag
    self.hashtag = name.gsub(/\W/, '') unless hashtag?
  end
end
