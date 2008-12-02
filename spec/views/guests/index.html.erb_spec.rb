require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/guests/index.html.erb" do
  include GuestsHelper
  
  before(:each) do
    assigns[:guests] = [
      stub_model(Guest,
        :target_type => Guest.targets(:capitalized).first,
        :status => "value for status"
      ),
      stub_model(Guest,
        :target_type => Guest.targets(:capitalized).first,
        :status => "value for status"
      )
    ]
  end

  it "should render list of guests" do
    render "/guests/index.html.erb"
    response.should have_tag("tr>td", Guest.targets(:capitalized).first, 2)
    response.should have_tag("tr>td", "value for status", 2)
  end
end

