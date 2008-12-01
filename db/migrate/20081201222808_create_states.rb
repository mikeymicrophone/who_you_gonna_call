class CreateStates < ActiveRecord::Migration
  def self.up
    create_table :states do |t|
      t.string :name
      t.integer :country_id
      t.integer :creator_id

      t.timestamps
    end
  end

  def self.down
    drop_table :states
  end
end
