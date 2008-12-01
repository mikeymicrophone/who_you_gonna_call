require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Person do
  before(:each) do
    @valid_attributes = {
      :first_name => "value for first_name",
      :middle_name => "value for middle_name",
      :last_name => "value for last_name",
      :user_id => "1"
    }
  end

  it "should create a new instance given valid attributes" do
    Person.create!(@valid_attributes)
  end
end
