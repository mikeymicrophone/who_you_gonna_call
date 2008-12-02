require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/email_uses/show.html.erb" do
  include EmailUsesHelper
  
  before(:each) do
    assigns[:email_use] = @email_use = stub_model(EmailUse,
      :target_type => EmailUse.targets(:capitalized).first
    )
  end

  it "should render attributes in <p>" do
    render "/email_uses/show.html.erb"
    response.should have_text(/value\ for\ target_type/)
  end
end

