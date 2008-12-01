class CreateParties < ActiveRecord::Migration
  def self.up
    create_table :parties do |t|
      t.datetime :time
      t.datetime :until
      t.string :target_type
      t.integer :target_id
      t.integer :creator_id

      t.timestamps
    end
  end

  def self.down
    drop_table :parties
  end
end
