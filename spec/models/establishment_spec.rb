require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Establishment do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :creator_id => "1"
    }
  end

  it "should create a new instance given valid attributes" do
    Establishment.create!(@valid_attributes)
  end
end
