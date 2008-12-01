require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/parties/edit.html.erb" do
  include PartiesHelper
  
  before(:each) do
    assigns[:party] = @party = stub_model(Party,
      :new_record? => false,
      :target_type => "value for target_type",
    )
  end

  it "should render edit form" do
    render "/parties/edit.html.erb"
    
    response.should have_tag("form[action=#{party_path(@party)}][method=post]") do
      with_tag('input#party_target_type[name=?]', "party[target_type]")
    end
  end
end


