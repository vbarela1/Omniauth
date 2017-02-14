class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.string :trip_name, null: false
      t.string :duration
      t.integer :budget
      t.integer :people_going

      t.timestamps
    end
  end
end
