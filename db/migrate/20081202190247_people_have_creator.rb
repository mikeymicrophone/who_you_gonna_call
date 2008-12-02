class PeopleHaveCreator < ActiveRecord::Migration
  def self.up
    add_column :people, :creator_id, :integer
    add_column :visits, :latest_time, :datetime
    rename_column :visits, :time, :earliest_time
  end

  def self.down
    remove_column :people, :creator_id
    remove_column :visits, :latest_time
    rename_column :visits, :earliest_time, :latest_time
  end
end
