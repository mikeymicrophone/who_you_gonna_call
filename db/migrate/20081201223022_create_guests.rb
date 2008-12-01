class CreateGuests < ActiveRecord::Migration
  def self.up
    create_table :guests do |t|
      t.integer :person_id
      t.string :target_type
      t.integer :target_id
      t.string :status
      t.integer :creator_id

      t.timestamps
    end
  end

  def self.down
    drop_table :guests
  end
end
