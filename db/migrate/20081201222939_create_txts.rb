class CreateTxts < ActiveRecord::Migration
  def self.up
    create_table :txts do |t|
      t.datetime :time
      t.integer :phone_id
      t.string :status
      t.integer :creator_id

      t.timestamps
    end
  end

  def self.down
    drop_table :txts
  end
end
