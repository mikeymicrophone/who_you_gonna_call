class PhoneExtension < ActiveRecord::Migration
  def self.up
    add_column :phones, :extension, :string
  end

  def self.down
    remove_column :phones, :extension
  end
end
