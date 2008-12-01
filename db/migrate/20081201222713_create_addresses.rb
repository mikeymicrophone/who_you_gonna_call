class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.string :street_number
      t.integer :street_id
      t.string :line2
      t.integer :zip_id
      t.integer :creator_id

      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end
