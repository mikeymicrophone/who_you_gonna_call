require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/zips/new.html.erb" do
  include ZipsHelper
  
  before(:each) do
    assigns[:zip] = stub_model(Zip,
      :new_record? => true,
      :name => "value for name"
    )
  end

  it "should render new form" do
    render "/zips/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", zips_path) do
      with_tag("input#zip_name[name=?]", "zip[name]")
    end
  end
end


