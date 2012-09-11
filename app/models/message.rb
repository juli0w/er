class Message < ActiveRecord::Base
  attr_accessible :content, :email, :name

  validates_presence_of :content
  validates_presence_of :email
  validates_presence_of :name
end
