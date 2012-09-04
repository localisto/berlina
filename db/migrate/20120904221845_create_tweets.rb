class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.integer :twitter_user_id
      t.integer :external_id, :limit => 8
      t.string :text
      t.string :image_url
      t.timestamps
    end

    add_index :tweets, :twitter_user_id
  end
end
