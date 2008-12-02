require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/zips/edit.html.erb" do
  include ZipsHelper
  
  before(:each) do
    assigns[:zip] = @zip = stub_model(Zip,
      :new_record? => false,
      :name => "value for name"
    )
  end

  it "should render edit form" do
    render "/zips/edit.html.erb"
    
    response.should have_tag("form[action=#{zip_path(@zip)}][method=post]") do
      with_tag('input#zip_name[name=?]', "zip[name]")
    end
  end
end


