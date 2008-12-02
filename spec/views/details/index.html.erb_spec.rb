require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/details/index.html.erb" do
  include DetailsHelper
  
  before(:each) do
    assigns[:details] = [
      stub_model(Detail,
        :content => "value for content",
        :target_type => Detail.targets(:capitalized).first
      ),
      stub_model(Detail,
        :content => "value for content",
        :target_type => Detail.targets(:capitalized).first
      )
    ]
  end

  it "should render list of details" do
    render "/details/index.html.erb"
    response.should have_tag("tr>td", "value for content", 2)
    response.should have_tag("tr>td", Detail.targets(:capitalized).first, 2)
  end
end

