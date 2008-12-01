require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Address do
  before(:each) do
    @valid_attributes = {
      :street_number => "value for street_number",
      :street_id => "1",
      :line2 => "value for line2",
      :zip_id => "1",
      :creator_id => "1"
    }
  end

  it "should create a new instance given valid attributes" do
    Address.create!(@valid_attributes)
  end
end
