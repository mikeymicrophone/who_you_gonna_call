require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/phones/index.html.erb" do
  include PhonesHelper
  
  before(:each) do
    assigns[:phones] = [
      stub_model(Phone,
        :number => "value for number",
        :area_code => "value for area_code",
        :country_code => "value for country_code",
        :name => "value for name",
      ),
      stub_model(Phone,
        :number => "value for number",
        :area_code => "value for area_code",
        :country_code => "value for country_code",
        :name => "value for name",
      )
    ]
  end

  it "should render list of phones" do
    render "/phones/index.html.erb"
    response.should have_tag("tr>td", "value for number", 2)
    response.should have_tag("tr>td", "value for area_code", 2)
    response.should have_tag("tr>td", "value for country_code", 2)
    response.should have_tag("tr>td", "value for name", 2)
  end
end

