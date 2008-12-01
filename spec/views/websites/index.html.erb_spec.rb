require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/websites/index.html.erb" do
  include WebsitesHelper
  
  before(:each) do
    assigns[:websites] = [
      stub_model(Website,
        :href => "value for href",
        :name => "value for name",
      ),
      stub_model(Website,
        :href => "value for href",
        :name => "value for name",
      )
    ]
  end

  it "should render list of websites" do
    render "/websites/index.html.erb"
    response.should have_tag("tr>td", "value for href", 2)
    response.should have_tag("tr>td", "value for name", 2)
  end
end

