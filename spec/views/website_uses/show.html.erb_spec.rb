require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/website_uses/show.html.erb" do
  include WebsiteUsesHelper
  
  before(:each) do
    assigns[:website_use] = @website_use = stub_model(WebsiteUse,
      :target_type => "value for target_type"
    )
  end

  it "should render attributes in <p>" do
    render "/website_uses/show.html.erb"
    response.should have_text(/value\ for\ target_type/)
  end
end

