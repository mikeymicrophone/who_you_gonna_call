require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/rendezvouzs/index.html.erb" do
  include RendezvouzsHelper
  
  before(:each) do
    assigns[:rendezvouzs] = [
      stub_model(Rendezvouz,
        :target_type => "value for target_type",
      ),
      stub_model(Rendezvouz,
        :target_type => "value for target_type",
      )
    ]
  end

  it "should render list of rendezvouzs" do
    render "/rendezvouzs/index.html.erb"
    response.should have_tag("tr>td", "value for target_type", 2)
  end
end

