require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/parties/index.html.erb" do
  include PartiesHelper
  
  before(:each) do
    assigns[:parties] = [
      stub_model(Party,
        :target_type => Party.targets(:capitalized).first,
        :time => Time.now,
        :until => Time.now
      ),
      stub_model(Party,
        :target_type => Party.targets(:capitalized).first,
        :time => Time.now,
        :until => Time.now
      )
    ]
  end

  it "should render list of parties" do
    render "/parties/index.html.erb"
    response.should have_tag("tr>td", Party.targets(:capitalized).first, 2)
  end
end

