require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Subscription do
  it 'should have accessible email' do
    Subscription.new(:email => "foo@bar.baz").email.should eql('foo@bar.baz')
  end

  it 'should validate presence of email' do
    @it = Subscription.new
    @it.valid?
    @it.should have(1).error_on(:email)
  end
end
