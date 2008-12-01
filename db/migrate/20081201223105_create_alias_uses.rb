class CreateAliasUses < ActiveRecord::Migration
  def self.up
    create_table :alias_uses do |t|
      t.integer :alias_id
      t.string :target_type
      t.integer :target_id
      t.integer :creator_id

      t.timestamps
    end
  end

  def self.down
    drop_table :alias_uses
  end
end
