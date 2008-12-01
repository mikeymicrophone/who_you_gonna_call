require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Phone do
  before(:each) do
    @valid_attributes = {
      :number => "value for number",
      :area_code => "value for area_code",
      :country_code => "value for country_code",
      :name => "value for name",
      :creator_id => "1"
    }
  end

  it "should create a new instance given valid attributes" do
    Phone.create!(@valid_attributes)
  end
end
