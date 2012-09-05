class Tweet < ActiveRecord::Base
  belongs_to :twitter_user

  validates :external_id, presence: true, uniqueness: true
  validates :text, presence: true
  validates :twitter_user, presence: true

  delegate :name, :username, :profile_image_url, to: :twitter_user

  scope :for_hashtag, lambda { |hashtag| where("text ilike ?", "%##{hashtag}%") }

  def as_json(options = {})
    {
        'id' => id,
        'external_id' => external_id,
        'text' => text,
        'name' => name,
        'username' => username,
        'profile_image_url' => profile_image_url,
        'created_at' => created_at.to_s(:db),
        'updated_at' => updated_at.to_s(:db)
    }
  end
end
