require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Call do
  before(:each) do
    @valid_attributes = {
      :time => Time.now,
      :target_type => "value for target_type",
      :target_id => "1",
      :status => "value for status",
      :creator_id => "1"
    }
  end

  it "should create a new instance given valid attributes" do
    Call.create!(@valid_attributes)
  end
end
