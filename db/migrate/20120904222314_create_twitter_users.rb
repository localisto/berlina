class CreateTwitterUsers < ActiveRecord::Migration
  def change
    create_table :twitter_users do |t|
      t.integer :external_id, :limit => 8
      t.string :username
      t.string :name
      t.string :profile_image_url
      t.timestamps
    end
  end
end
