require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/emails/show.html.erb" do
  include EmailsHelper
  
  before(:each) do
    assigns[:email] = @email = stub_model(Email,
      :address => "value for address",
    )
  end

  it "should render attributes in <p>" do
    render "/emails/show.html.erb"
    response.should have_text(/value\ for\ address/)
  end
end

