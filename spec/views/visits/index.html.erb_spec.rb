require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/visits/index.html.erb" do
  include VisitsHelper
  
  before(:each) do
    assigns[:visits] = [
      stub_model(Visit,
        :target_type => Visit.targets(:capitalized).first,
        :earliest_time => Time.now,
        :latest_time => Time.now
      ),
      stub_model(Visit,
        :target_type => Visit.targets(:capitalized).first,
        :earliest_time => Time.now,
        :latest_time => Time.now
      )
    ]
  end

  it "should render list of visits" do
    render "/visits/index.html.erb"
    response.should have_tag("tr>td", Visit.targets(:capitalized).first, 2)
  end
end

