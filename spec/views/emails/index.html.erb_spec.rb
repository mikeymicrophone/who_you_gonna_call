require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/emails/index.html.erb" do
  include EmailsHelper
  
  before(:each) do
    assigns[:emails] = [
      stub_model(Email,
        :address => "value for address"
      ),
      stub_model(Email,
        :address => "value for address"
      )
    ]
  end

  it "should render list of emails" do
    render "/emails/index.html.erb"
    response.should have_tag("tr>td", "value for address", 2)
  end
end

