require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/rendezvouzs/show.html.erb" do
  include RendezvouzsHelper
  
  before(:each) do
    assigns[:rendezvouz] = @rendezvouz = stub_model(Rendezvouz,
      :target_type => "value for target_type",
    )
  end

  it "should render attributes in <p>" do
    render "/rendezvouzs/show.html.erb"
    response.should have_text(/value\ for\ target_type/)
  end
end

