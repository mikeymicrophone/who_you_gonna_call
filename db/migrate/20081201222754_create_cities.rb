class CreateCities < ActiveRecord::Migration
  def self.up
    create_table :cities do |t|
      t.string :name
      t.integer :state_id
      t.integer :creator_id

      t.timestamps
    end
  end

  def self.down
    drop_table :cities
  end
end
