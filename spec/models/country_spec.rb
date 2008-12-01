require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Country do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :creator_id => "1"
    }
  end

  it "should create a new instance given valid attributes" do
    Country.create!(@valid_attributes)
  end
end
