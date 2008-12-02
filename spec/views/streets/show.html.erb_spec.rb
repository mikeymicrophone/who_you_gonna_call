require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/streets/show.html.erb" do
  include StreetsHelper
  
  before(:each) do
    assigns[:street] = @street = stub_model(Street,
      :name => "value for name"
    )
  end

  it "should render attributes in <p>" do
    render "/streets/show.html.erb"
    response.should have_text(/value\ for\ name/)
  end
end

