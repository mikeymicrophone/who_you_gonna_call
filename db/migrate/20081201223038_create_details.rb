class CreateDetails < ActiveRecord::Migration
  def self.up
    create_table :details do |t|
      t.text :content
      t.string :target_type
      t.integer :target_id
      t.integer :creator_id

      t.timestamps
    end
  end

  def self.down
    drop_table :details
  end
end
