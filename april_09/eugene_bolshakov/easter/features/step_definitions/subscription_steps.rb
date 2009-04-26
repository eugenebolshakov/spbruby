When /^I subscribe with "(.*)"$/ do |email|
  When %{I fill in "Email" with "#{email}"}
  And %{I press "Subscribe"}
end

Given /^there are the following subscribers:$/ do |table|
  @subscribers = table.hashes.inject([]) do |r, s|
    r << Subscription.create(s); r
  end
end

When /^reminders are sent out$/ do
  send_reminders_out
end

Then /^(\d+) (people|person) should receive emails?$/ do |emails_number, ignore|
  emails = ActionMailer::Base.deliveries
  emails.size.should eql(emails_number.to_i)
  emails.each do |email|
    email.subject.should eql("Easter's Coming")
    email.body.should include("Don't forget to celebrate")
  end
  @subscribers.collect(&:email).should == 
    emails.collect(&:to).flatten
end
