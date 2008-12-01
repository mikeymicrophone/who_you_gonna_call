class CreateAddressUses < ActiveRecord::Migration
  def self.up
    create_table :address_uses do |t|
      t.integer :address_id
      t.integer :unit_id
      t.string :target_type
      t.integer :target_id
      t.integer :creator_id

      t.timestamps
    end
  end

  def self.down
    drop_table :address_uses
  end
end
