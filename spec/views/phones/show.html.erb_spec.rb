require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/phones/show.html.erb" do
  include PhonesHelper
  
  before(:each) do
    assigns[:phone] = @phone = stub_model(Phone,
      :number => "value for number",
      :area_code => "value for area_code",
      :country_code => "value for country_code",
      :name => "value for name",
    )
  end

  it "should render attributes in <p>" do
    render "/phones/show.html.erb"
    response.should have_text(/value\ for\ number/)
    response.should have_text(/value\ for\ area_code/)
    response.should have_text(/value\ for\ country_code/)
    response.should have_text(/value\ for\ name/)
  end
end

