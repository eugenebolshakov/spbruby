class EasterMailer < ActionMailer::Base
  def easter_reminder(email)
    recipients email
    subject    "Easter's Coming"
  end
end
