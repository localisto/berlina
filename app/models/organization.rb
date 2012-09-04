class Organization < ActiveRecord::Base
  has_many :events, dependent: :destroy

  validates :name, presence: true

  before_save :set_hashtag

  private

  def set_hashtag
    self.hashtag = name.gsub(/\W/, '') unless hashtag?
  end
end
