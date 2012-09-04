class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :external_id
      t.string :name
      t.datetime :start_time
      t.datetime :end_time
      t.timestamps
    end

    add_index :events, :external_id, unique: true
  end
end
