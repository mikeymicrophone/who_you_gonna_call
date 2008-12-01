require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/states/new.html.erb" do
  include StatesHelper
  
  before(:each) do
    assigns[:state] = stub_model(State,
      :new_record? => true,
      :name => "value for name",
    )
  end

  it "should render new form" do
    render "/states/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", states_path) do
      with_tag("input#state_name[name=?]", "state[name]")
    end
  end
end


