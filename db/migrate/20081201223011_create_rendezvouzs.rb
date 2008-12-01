class CreateRendezvouzs < ActiveRecord::Migration
  def self.up
    create_table :rendezvouzs do |t|
      t.datetime :time
      t.string :target_type
      t.integer :target_id
      t.integer :creator_id

      t.timestamps
    end
  end

  def self.down
    drop_table :rendezvouzs
  end
end
