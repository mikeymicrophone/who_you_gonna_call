require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/cities/show.html.erb" do
  include CitiesHelper
  
  before(:each) do
    assigns[:city] = @city = stub_model(City,
      :name => "value for name"
    )
  end

  it "should render attributes in <p>" do
    render "/cities/show.html.erb"
    response.should have_text(/value\ for\ name/)
  end
end

