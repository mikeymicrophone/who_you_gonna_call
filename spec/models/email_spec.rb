require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Email do
  before(:each) do
    @valid_attributes = {
      :address => "value for address",
      :creator_id => "1"
    }
  end

  it "should create a new instance given valid attributes" do
    Email.create!(@valid_attributes)
  end
end
