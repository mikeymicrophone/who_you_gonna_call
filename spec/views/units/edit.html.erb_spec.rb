require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/units/edit.html.erb" do
  include UnitsHelper
  
  before(:each) do
    assigns[:unit] = @unit = stub_model(Unit,
      :new_record? => false,
      :number => "value for number",
      :line2 => "value for line2",
    )
  end

  it "should render edit form" do
    render "/units/edit.html.erb"
    
    response.should have_tag("form[action=#{unit_path(@unit)}][method=post]") do
      with_tag('input#unit_number[name=?]', "unit[number]")
      with_tag('input#unit_line2[name=?]', "unit[line2]")
    end
  end
end


