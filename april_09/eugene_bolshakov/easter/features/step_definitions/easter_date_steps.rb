Given /^today is "(.*)"$/ do |date|
  Time.stub!(:now).and_return(Time.parse(date))
end
