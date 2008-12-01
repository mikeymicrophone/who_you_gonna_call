class CreateEmailUses < ActiveRecord::Migration
  def self.up
    create_table :email_uses do |t|
      t.integer :email_id
      t.string :target_type
      t.integer :target_id
      t.integer :creator_id

      t.timestamps
    end
  end

  def self.down
    drop_table :email_uses
  end
end
