class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.text :description, null: false
      t.string :physical_address, null: false
      t.string :country, null: false
      t.string :city, null: false
      t.belongs_to :location

      t.timestamps
    end
  end
end
