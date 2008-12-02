require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/calls/new.html.erb" do
  include CallsHelper
  
  before(:each) do
    assigns[:call] = stub_model(Call,
      :new_record? => true,
      :target_type => "value for target_type",
      :status => "value for status"
    )
  end

  it "should render new form" do
    render "/calls/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", calls_path) do
      with_tag("input#call_target_type[name=?]", "call[target_type]")
      with_tag("input#call_status[name=?]", "call[status]")
    end
  end
end


