require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/email_uses/index.html.erb" do
  include EmailUsesHelper
  
  before(:each) do
    assigns[:email_uses] = [
      stub_model(EmailUse,
        :target_type => EmailUse.targets(:capitalized).first
      ),
      stub_model(EmailUse,
        :target_type => EmailUse.targets(:capitalized).first
      )
    ]
  end

  it "should render list of email_uses" do
    render "/email_uses/index.html.erb"
    response.should have_tag("tr>td", EmailUse.targets(:capitalized).first, 2)
  end
end

