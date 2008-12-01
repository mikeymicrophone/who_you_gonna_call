require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/guests/edit.html.erb" do
  include GuestsHelper
  
  before(:each) do
    assigns[:guest] = @guest = stub_model(Guest,
      :new_record? => false,
      :target_type => "value for target_type",
      :status => "value for status",
    )
  end

  it "should render edit form" do
    render "/guests/edit.html.erb"
    
    response.should have_tag("form[action=#{guest_path(@guest)}][method=post]") do
      with_tag('input#guest_target_type[name=?]', "guest[target_type]")
      with_tag('input#guest_status[name=?]', "guest[status]")
    end
  end
end


