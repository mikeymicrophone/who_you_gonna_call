require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/states/edit.html.erb" do
  include StatesHelper
  
  before(:each) do
    assigns[:state] = @state = stub_model(State,
      :new_record? => false,
      :name => "value for name"
    )
  end

  it "should render edit form" do
    render "/states/edit.html.erb"
    
    response.should have_tag("form[action=#{state_path(@state)}][method=post]") do
      with_tag('input#state_name[name=?]', "state[name]")
    end
  end
end


