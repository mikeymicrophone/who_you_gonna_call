require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ApplicationHelper do
  describe 'collection naming' do
    it 'should pluralize the string that was passed' do
      helper.collection('call').should == 'calls'
      helper.collection('calls').should == 'calls'
    end
    
    it 'should convert a symbol to a string' do
      helper.collection(:call).should == 'calls'
      helper.collection(:calls).should == 'calls'
    end
    
    it 'should return the table name of an object' do
      helper.collection(AddressUse.new).should == 'address_uses'
    end
  end
  
  describe 'collection routing' do
    it 'should generate correct paths' do
      helper.collection_path('call').should == '/calls'
      helper.collection_path(:website).should == '/websites'
      helper.collection_path(Phone.new).should == '/phones'
    end
  end
  
  describe 'collection linking' do
    it 'should link to the right collection' do
      helper.collection_link('phone_use').should =~ /phone_uses/
      helper.collection_link(:visits).should =~ /visits/
      helper.collection_link(Rendezvouz.new).should =~ /rendezvouzs/
    end
  end
  
  describe 'scoped collection routing' do
    it 'should route to a bland collection if no scope object' do
      helper.scoped_collection_path('street').should == '/streets'
    end
    
    it 'should route to a nested collection if scope object present' do
      p = Party.create
      helper.scoped_collection_path('guest', p).should == '/parties/' + p.id.to_s + '/guests'
    end
  end
  
  describe 'scoped collection linking' do
    it 'should link to a bland collection if no scope object' do
      helper.scoped_collection_link('establishments').should =~ /establishments/
    end
    
    it 'should link to a nested collection if scope object present' do
      helper.scoped_collection_link('messages', Service.create(:name => 'MySpace')).should =~ /services\/\d+\/messages/
    end
  end
  
  
  
end