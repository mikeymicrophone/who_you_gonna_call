require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/websites/show.html.erb" do
  include WebsitesHelper
  
  before(:each) do
    assigns[:website] = @website = stub_model(Website,
      :href => "value for href",
      :name => "value for name"
    )
  end

  it "should render attributes in <p>" do
    render "/websites/show.html.erb"
    response.should have_text(/value\ for\ href/)
    response.should have_text(/value\ for\ name/)
  end
end

