class CreatePhones < ActiveRecord::Migration
  def self.up
    create_table :phones do |t|
      t.string :number
      t.string :area_code
      t.string :country_code
      t.string :name
      t.integer :creator_id

      t.timestamps
    end
  end

  def self.down
    drop_table :phones
  end
end
