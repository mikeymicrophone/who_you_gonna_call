require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/rendezvouzs/index.html.erb" do
  include RendezvouzsHelper
  
  before(:each) do
    assigns[:rendezvouzs] = [
      stub_model(Rendezvouz,
        :target_type => Rendezvouz.targets(:capitalized).first,
        :time => Time.now
      ),
      stub_model(Rendezvouz,
        :target_type => Rendezvouz.targets(:capitalized).first,
        :time => Time.now
      )
    ]
  end

  it "should render list of rendezvouzs" do
    render "/rendezvouzs/index.html.erb"
    response.should have_tag("tr>td", Rendezvouz.targets(:capitalized).first, 2)
  end
end

