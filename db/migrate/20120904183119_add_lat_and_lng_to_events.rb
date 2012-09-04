class AddLatAndLngToEvents < ActiveRecord::Migration
  def change
    add_column :events, :lat, :decimal, precision: 15, scale: 10
    add_column :events, :lng, :decimal, precision: 15, scale: 10
  end
end
