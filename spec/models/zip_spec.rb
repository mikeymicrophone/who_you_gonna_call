require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Zip do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :city_id => "1",
      :state_id => "1",
      :creator_id => "1"
    }
  end

  it "should create a new instance given valid attributes" do
    Zip.create!(@valid_attributes)
  end
end
