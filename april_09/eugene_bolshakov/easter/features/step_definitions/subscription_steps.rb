When /^I subscribe with "(.*)"$/ do |email|
  When %{I fill in "Email" with "#{email}"}
  And %{I press "Subscribe"}
end
