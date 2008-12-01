require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/states/index.html.erb" do
  include StatesHelper
  
  before(:each) do
    assigns[:states] = [
      stub_model(State,
        :name => "value for name",
      ),
      stub_model(State,
        :name => "value for name",
      )
    ]
  end

  it "should render list of states" do
    render "/states/index.html.erb"
    response.should have_tag("tr>td", "value for name", 2)
  end
end

