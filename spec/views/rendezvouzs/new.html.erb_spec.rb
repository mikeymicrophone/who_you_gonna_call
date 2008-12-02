require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/rendezvouzs/new.html.erb" do
  include RendezvouzsHelper
  
  before(:each) do
    assigns[:rendezvouz] = stub_model(Rendezvouz,
      :new_record? => true,
      :target_type => "value for target_type"
    )
  end

  it "should render new form" do
    render "/rendezvouzs/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", rendezvouzs_path) do
      with_tag("input#rendezvouz_target_type[name=?]", "rendezvouz[target_type]")
    end
  end
end


