require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/websites/new.html.erb" do
  include WebsitesHelper
  
  before(:each) do
    assigns[:website] = stub_model(Website,
      :new_record? => true,
      :href => "value for href",
      :name => "value for name",
    )
  end

  it "should render new form" do
    render "/websites/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", websites_path) do
      with_tag("input#website_href[name=?]", "website[href]")
      with_tag("input#website_name[name=?]", "website[name]")
    end
  end
end


