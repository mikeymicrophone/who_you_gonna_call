require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/website_uses/index.html.erb" do
  include WebsiteUsesHelper
  
  before(:each) do
    assigns[:website_uses] = [
      stub_model(WebsiteUse,
        :target_type => WebsiteUse.targets(:capitalized).first
      ),
      stub_model(WebsiteUse,
        :target_type => WebsiteUse.targets(:capitalized).first
      )
    ]
  end

  it "should render list of website_uses" do
    render "/website_uses/index.html.erb"
    response.should have_tag("tr>td", WebsiteUse.targets(:capitalized).first, 2)
  end
end

