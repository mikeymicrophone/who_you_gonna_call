require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Alias do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :service_id => "1",
      :creator_id => "1"
    }
  end

  it "should create a new instance given valid attributes" do
    Alias.create!(@valid_attributes)
  end
end
