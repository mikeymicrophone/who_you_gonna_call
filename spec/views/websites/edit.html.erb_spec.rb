require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/websites/edit.html.erb" do
  include WebsitesHelper
  
  before(:each) do
    assigns[:website] = @website = stub_model(Website,
      :new_record? => false,
      :href => "value for href",
      :name => "value for name",
    )
  end

  it "should render edit form" do
    render "/websites/edit.html.erb"
    
    response.should have_tag("form[action=#{website_path(@website)}][method=post]") do
      with_tag('input#website_href[name=?]', "website[href]")
      with_tag('input#website_name[name=?]', "website[name]")
    end
  end
end


