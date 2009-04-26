# encoding: utf-8

Допустим /^среди подписчиков есть "(.*)"$/ do |email|
  Subscription.create!(:email => email)
end

Если /^я открываю список подписчиков$/ do
  visit "/subscriptions/"
end

То /^я должен видеть "(.*)"$/ do |text|
  Then %{I should see "#{text}"}
end
