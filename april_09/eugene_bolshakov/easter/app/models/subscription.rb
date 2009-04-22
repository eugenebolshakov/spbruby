class Subscription < ActiveRecord::Base
  attr_accessible :email
  validates_presence_of :email
end
