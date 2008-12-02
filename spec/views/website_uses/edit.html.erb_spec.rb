require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/website_uses/edit.html.erb" do
  include WebsiteUsesHelper
  
  before(:each) do
    assigns[:website_use] = @website_use = stub_model(WebsiteUse,
      :new_record? => false,
      :target_type => WebsiteUse.targets(:capitalized).first
    )
  end

  it "should render edit form" do
    render "/website_uses/edit.html.erb"
    
    response.should have_tag("form[action=#{website_use_path(@website_use)}][method=post]") do
      with_tag('input#website_use_target_type[name=?]', "website_use[target_type]")
    end
  end
end


