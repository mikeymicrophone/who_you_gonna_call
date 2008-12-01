require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Street do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :city_id => "1",
      :creator_id => "1"
    }
  end

  it "should create a new instance given valid attributes" do
    Street.create!(@valid_attributes)
  end
end
