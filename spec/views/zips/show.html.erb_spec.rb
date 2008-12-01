require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/zips/show.html.erb" do
  include ZipsHelper
  
  before(:each) do
    assigns[:zip] = @zip = stub_model(Zip,
      :name => "value for name",
    )
  end

  it "should render attributes in <p>" do
    render "/zips/show.html.erb"
    response.should have_text(/value\ for\ name/)
  end
end

