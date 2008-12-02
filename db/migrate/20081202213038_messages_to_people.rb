class MessagesToPeople < ActiveRecord::Migration
  def self.up
    add_column :messages, :person_id, :integer
  end

  def self.down
    remove_column :messages, :person_id
  end
end
