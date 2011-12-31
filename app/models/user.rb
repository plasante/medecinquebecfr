# == Schema Information
#
# Table name: users
#
#  id         :integer(4)      not null, primary key
#  first_name :string(50)
#  last_name  :string(50)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email
  
  validates :first_name, :presence => true,
                         :length   => { :maximum => 50 }
  
  validates :last_name,  :presence => true,
                         :length   => { :maximum => 50 }
end
