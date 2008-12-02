require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/establishments/new.html.erb" do
  include EstablishmentsHelper
  
  before(:each) do
    assigns[:establishment] = stub_model(Establishment,
      :new_record? => true,
      :name => "value for name"
    )
  end

  it "should render new form" do
    render "/establishments/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", establishments_path) do
      with_tag("input#establishment_name[name=?]", "establishment[name]")
    end
  end
end


