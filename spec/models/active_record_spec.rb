require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

class Banana < ActiveRecord::Base
  def self.target_list
    %w[ pear apple peach ]
  end
  scope_targets
end

describe ActiveRecord::Base do
  it 'should deliver its targets in proper format' do
    Banana.targets.should == ['pear', 'apple', 'peach']
    Banana.targets(:capital).should == ['Pear', 'Apple', 'Peach']
    Banana.targets(:symbol).should == [:pear, :apple, :peach]
    Banana.targets(:select).should == [['pear', 'Pear'], ['apple', 'Apple'], ['peach', 'Peach']]
    Banana.targets(:plural).should == ['pears', 'apples', 'peaches']
    Banana.targets(:sing_plural).should == [['pear', 'pears'], ['apple', 'apples'], ['peach', 'peaches']]
  end
  
  it 'should have named scopes for its targets' do
    cp = Call.create(:target => Person.create)
    
    pe = Call.person
    ph = Call.phone
    pu = Call.phone_use
    e = Call.establishment
    
    pe.should == [cp]
    ph.should == []
    pu.should == []
    e.should == []
  end
  
  it 'should group targets of an object that belongs to it' do
    u = User.create(:login => 'obama', :password => 'joebiden', :password_confirmation => 'joebiden', :email => 'billybiden@obama.com')
    p = Person.create
    a = Authorization.create(:target => p, :user => u)
    u.people_from_authorizations.should == [p]
    u.phones_from_authorizations.should == []
    u.details_from_authorizations.should == []
  end

  #     @cities = City.scope_down(self, params, 'state', 'country', 'street', 'zip', 'address', 'detail', 'email_use', 'email', 'phone_use', 'phone', 'website_use', 'website', 'visit', 'guest')
  it 'should be able to scope results down to objects associated with a particular object' do
    controller = CitiesController.new
    ny = State.create(:name => 'New York')
    bk = City.create(:name => 'Brooklyn', :state => ny)
    params = {:state_id => ny.id}
    @cities = City.scope_down(controller, params, 'state')
    @cities.should == [bk]
  end
    
  it 'should set an instance variable with the scope object' do
    controller = flexmock(o = Object.new)
    ny = State.create(:name => 'New York')
    state = flexmock(State)
    params = {:state_id => ny.id}
    @cities = City.scope_down(o, params, 'state')
    state.should_receive(:find).with(ny.id).once.and_return(ny)
    controller.should_receive(:instance_variable_set).with('@state', ny).once.and_return(ny)
    o.instance_variable_get('@state').should == ny # failing but works in cities#index
  end
end