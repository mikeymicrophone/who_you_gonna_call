require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/establishments/edit.html.erb" do
  include EstablishmentsHelper
  
  before(:each) do
    assigns[:establishment] = @establishment = stub_model(Establishment,
      :new_record? => false,
      :name => "value for name",
    )
  end

  it "should render edit form" do
    render "/establishments/edit.html.erb"
    
    response.should have_tag("form[action=#{establishment_path(@establishment)}][method=post]") do
      with_tag('input#establishment_name[name=?]', "establishment[name]")
    end
  end
end


