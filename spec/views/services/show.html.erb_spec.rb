require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/services/show.html.erb" do
  include ServicesHelper
  
  before(:each) do
    assigns[:service] = @service = stub_model(Service,
      :name => "value for name",
    )
  end

  it "should render attributes in <p>" do
    render "/services/show.html.erb"
    response.should have_text(/value\ for\ name/)
  end
end

