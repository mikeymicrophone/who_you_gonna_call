class CreateWebsiteUses < ActiveRecord::Migration
  def self.up
    create_table :website_uses do |t|
      t.integer :website_id
      t.string :target_type
      t.integer :target_id
      t.integer :creator_id

      t.timestamps
    end
  end

  def self.down
    drop_table :website_uses
  end
end
