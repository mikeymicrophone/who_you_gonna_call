class CreateZips < ActiveRecord::Migration
  def self.up
    create_table :zips do |t|
      t.string :name
      t.integer :city_id
      t.integer :state_id
      t.integer :creator_id

      t.timestamps
    end
  end

  def self.down
    drop_table :zips
  end
end
