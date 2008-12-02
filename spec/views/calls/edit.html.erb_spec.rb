require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/calls/edit.html.erb" do
  include CallsHelper
  
  before(:each) do
    assigns[:call] = @call = stub_model(Call,
      :new_record? => false,
      :target_type => Call.targets(:capitalized).first,
      :status => "value for status"
    )
  end

  it "should render edit form" do
    render "/calls/edit.html.erb"
    
    response.should have_tag("form[action=#{call_path(@call)}][method=post]") do
      with_tag('input#call_target_type[name=?]', "call[target_type]")
      with_tag('input#call_status[name=?]', "call[status]")
    end
  end
end


