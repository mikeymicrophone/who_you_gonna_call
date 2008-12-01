class CreateUnits < ActiveRecord::Migration
  def self.up
    create_table :units do |t|
      t.string :number
      t.integer :address_id
      t.string :line2
      t.integer :creator_id

      t.timestamps
    end
  end

  def self.down
    drop_table :units
  end
end
