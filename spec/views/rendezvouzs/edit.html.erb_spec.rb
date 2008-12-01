require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/rendezvouzs/edit.html.erb" do
  include RendezvouzsHelper
  
  before(:each) do
    assigns[:rendezvouz] = @rendezvouz = stub_model(Rendezvouz,
      :new_record? => false,
      :target_type => "value for target_type",
    )
  end

  it "should render edit form" do
    render "/rendezvouzs/edit.html.erb"
    
    response.should have_tag("form[action=#{rendezvouz_path(@rendezvouz)}][method=post]") do
      with_tag('input#rendezvouz_target_type[name=?]', "rendezvouz[target_type]")
    end
  end
end


