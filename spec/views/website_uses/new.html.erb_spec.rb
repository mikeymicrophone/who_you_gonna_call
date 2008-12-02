require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/website_uses/new.html.erb" do
  include WebsiteUsesHelper
  
  before(:each) do
    assigns[:website_use] = stub_model(WebsiteUse,
      :new_record? => true,
      :target_type => "value for target_type"
    )
  end

  it "should render new form" do
    render "/website_uses/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", website_uses_path) do
      with_tag("input#website_use_target_type[name=?]", "website_use[target_type]")
    end
  end
end


