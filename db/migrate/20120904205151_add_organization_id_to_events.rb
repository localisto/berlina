class AddOrganizationIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :organization_id, :integer
    add_index :events, :organization_id
    remove_column :events, :name
    remove_column :events, :hashtag
  end
end
