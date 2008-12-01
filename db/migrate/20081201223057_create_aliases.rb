class CreateAliases < ActiveRecord::Migration
  def self.up
    create_table :aliases do |t|
      t.string :name
      t.integer :service_id
      t.integer :creator_id

      t.timestamps
    end
  end

  def self.down
    drop_table :aliases
  end
end
