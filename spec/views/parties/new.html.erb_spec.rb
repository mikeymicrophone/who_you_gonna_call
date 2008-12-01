require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/parties/new.html.erb" do
  include PartiesHelper
  
  before(:each) do
    assigns[:party] = stub_model(Party,
      :new_record? => true,
      :target_type => "value for target_type",
    )
  end

  it "should render new form" do
    render "/parties/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", parties_path) do
      with_tag("input#party_target_type[name=?]", "party[target_type]")
    end
  end
end


