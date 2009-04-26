class Subscription < ActiveRecord::Base
  attr_accessible :email
  validates_presence_of :email

  def self.send_reminders_out
    all.each { |s| EasterMailer.deliver_easter_reminder(s.email) }
  end
end
