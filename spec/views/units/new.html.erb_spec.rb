require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/units/new.html.erb" do
  include UnitsHelper
  
  before(:each) do
    assigns[:unit] = stub_model(Unit,
      :new_record? => true,
      :number => "value for number",
      :line2 => "value for line2"
    )
  end

  it "should render new form" do
    render "/units/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", units_path) do
      with_tag("input#unit_number[name=?]", "unit[number]")
      with_tag("input#unit_line2[name=?]", "unit[line2]")
    end
  end
end


