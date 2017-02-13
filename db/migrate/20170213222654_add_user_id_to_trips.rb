class AddUserIdToTrips < ActiveRecord::Migration[5.0]
  def up
    add_column :trips, :user_id, :integer, null: false
  end

  def down 
    remove_column :trips, :user_id
  end 
end
