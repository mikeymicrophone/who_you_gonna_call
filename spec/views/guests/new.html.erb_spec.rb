require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/guests/new.html.erb" do
  include GuestsHelper
  
  before(:each) do
    assigns[:guest] = stub_model(Guest,
      :new_record? => true,
      :target_type => Guest.targets(:capitalized).first,
      :status => "value for status"
    )
  end

  it "should render new form" do
    render "/guests/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", guests_path) do
      with_tag("input#guest_target_type[name=?]", "guest[target_type]")
      with_tag("input#guest_status[name=?]", "guest[status]")
    end
  end
end


