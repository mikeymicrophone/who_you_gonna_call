class CreateCalls < ActiveRecord::Migration
  def self.up
    create_table :calls do |t|
      t.datetime :time
      t.string :target_type
      t.integer :target_id
      t.string :status
      t.integer :creator_id

      t.timestamps
    end
  end

  def self.down
    drop_table :calls
  end
end
