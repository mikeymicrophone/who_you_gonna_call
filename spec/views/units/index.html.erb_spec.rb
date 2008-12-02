require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/units/index.html.erb" do
  include UnitsHelper
  
  before(:each) do
    assigns[:units] = [
      stub_model(Unit,
        :number => "value for number",
        :line2 => "value for line2"
      ),
      stub_model(Unit,
        :number => "value for number",
        :line2 => "value for line2"
      )
    ]
  end

  it "should render list of units" do
    render "/units/index.html.erb"
    response.should have_tag("tr>td", "value for number", 2)
    response.should have_tag("tr>td", "value for line2", 2)
  end
end

