require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/calls/index.html.erb" do
  include CallsHelper
  
  before(:each) do
    assigns[:calls] = [
      stub_model(Call,
        :target_type => Call.targets(:capitalized).first,
        :status => "value for status"
      ),
      stub_model(Call,
        :target_type => Call.targets(:capitalized).first,
        :status => "value for status"
      )
    ]
  end

  it "should render list of calls" do
    render "/calls/index.html.erb"
    response.should have_tag("tr>td", Call.targets(:capitalized).first, 2)
    response.should have_tag("tr>td", "value for status", 2)
  end
end

