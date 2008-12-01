require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/website_uses/index.html.erb" do
  include WebsiteUsesHelper
  
  before(:each) do
    assigns[:website_uses] = [
      stub_model(WebsiteUse,
        :target_type => "value for target_type",
      ),
      stub_model(WebsiteUse,
        :target_type => "value for target_type",
      )
    ]
  end

  it "should render list of website_uses" do
    render "/website_uses/index.html.erb"
    response.should have_tag("tr>td", "value for target_type", 2)
  end
end

