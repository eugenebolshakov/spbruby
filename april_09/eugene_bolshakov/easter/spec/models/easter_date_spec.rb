require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe EasterDate do

  before(:each) do
    @it = EasterDate.new(2009)
  end

  it 'should be initialized with year' do
    @it.year.should eql(2009)
  end

  it 'should return catholic easter date' do
    @it.catholic_date.should == Date.parse('12 April 2009')
  end

  it 'should return orthodox easter date' do
    @it.orthodox_date.should == Date.parse('19 April 2009')
  end

end
