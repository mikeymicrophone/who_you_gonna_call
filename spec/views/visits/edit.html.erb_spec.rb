require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/visits/edit.html.erb" do
  include VisitsHelper
  
  before(:each) do
    assigns[:visit] = @visit = stub_model(Visit,
      :new_record? => false,
      :target_type => "value for target_type",
    )
  end

  it "should render edit form" do
    render "/visits/edit.html.erb"
    
    response.should have_tag("form[action=#{visit_path(@visit)}][method=post]") do
      with_tag('input#visit_target_type[name=?]', "visit[target_type]")
    end
  end
end


