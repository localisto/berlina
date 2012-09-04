class AddVenueAndContactFieldsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :venue, :string
    add_column :events, :venue_extra, :string
    add_column :events, :address, :string
    add_column :events, :contact_name, :string
    add_column :events, :contact_position, :string
    add_column :events, :contact_phone, :string
    add_column :events, :contact_email, :string
  end
end
