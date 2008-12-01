require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/states/show.html.erb" do
  include StatesHelper
  
  before(:each) do
    assigns[:state] = @state = stub_model(State,
      :name => "value for name",
    )
  end

  it "should render attributes in <p>" do
    render "/states/show.html.erb"
    response.should have_text(/value\ for\ name/)
  end
end

