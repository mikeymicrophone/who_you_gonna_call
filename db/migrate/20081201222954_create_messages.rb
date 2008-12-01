class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.datetime :time
      t.integer :service_id
      t.string :status
      t.integer :creator_id

      t.timestamps
    end
  end

  def self.down
    drop_table :messages
  end
end
