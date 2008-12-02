require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/visits/new.html.erb" do
  include VisitsHelper
  
  before(:each) do
    assigns[:visit] = stub_model(Visit,
      :new_record? => true,
      :target_type => "value for target_type"
    )
  end

  it "should render new form" do
    render "/visits/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", visits_path) do
      with_tag("input#visit_target_type[name=?]", "visit[target_type]")
    end
  end
end


