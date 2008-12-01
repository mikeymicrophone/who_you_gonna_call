class CreateStreets < ActiveRecord::Migration
  def self.up
    create_table :streets do |t|
      t.string :name
      t.integer :city_id
      t.integer :creator_id

      t.timestamps
    end
  end

  def self.down
    drop_table :streets
  end
end
