require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Unit do
  before(:each) do
    @valid_attributes = {
      :number => "value for number",
      :address_id => "1",
      :line2 => "value for line2",
      :creator_id => "1"
    }
  end

  it "should create a new instance given valid attributes" do
    Unit.create!(@valid_attributes)
  end
end
