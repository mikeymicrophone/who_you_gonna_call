require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/units/show.html.erb" do
  include UnitsHelper
  
  before(:each) do
    assigns[:unit] = @unit = stub_model(Unit,
      :number => "value for number",
      :line2 => "value for line2",
    )
  end

  it "should render attributes in <p>" do
    render "/units/show.html.erb"
    response.should have_text(/value\ for\ number/)
    response.should have_text(/value\ for\ line2/)
  end
end

