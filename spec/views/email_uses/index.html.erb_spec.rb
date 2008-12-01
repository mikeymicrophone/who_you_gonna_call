require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/email_uses/index.html.erb" do
  include EmailUsesHelper
  
  before(:each) do
    assigns[:email_uses] = [
      stub_model(EmailUse,
        :target_type => "value for target_type",
      ),
      stub_model(EmailUse,
        :target_type => "value for target_type",
      )
    ]
  end

  it "should render list of email_uses" do
    render "/email_uses/index.html.erb"
    response.should have_tag("tr>td", "value for target_type", 2)
  end
end

