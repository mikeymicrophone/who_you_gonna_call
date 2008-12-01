require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Txt do
  before(:each) do
    @valid_attributes = {
      :time => Time.now,
      :phone_id => "1",
      :status => "value for status",
      :creator_id => "1"
    }
  end

  it "should create a new instance given valid attributes" do
    Txt.create!(@valid_attributes)
  end
end
