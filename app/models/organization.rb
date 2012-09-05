class Organization < ActiveRecord::Base
  attr_accessible :hashtag

  has_many :events, dependent: :destroy

  validates :name, presence: true

  before_save :set_hashtag

  class << self
    def hashtags
      all.map { |organization| "##{organization.hashtag}" }
    end
  end

  private

  def set_hashtag
    self.hashtag = name.gsub(/\W/, '') unless hashtag?
  end
end
