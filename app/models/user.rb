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
  before_save :check_maximum
  
  attr_accessible :first_name, :last_name, :email
  
  validates :first_name, :presence   => true,
                         :length     => { :maximum => 50 }
  
  validates :last_name,  :presence   => true,
                         :length     => { :maximum => 50 }
                         
  validates :email,      :presence   => true,
                         :format     => { :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                         :uniqueness => { :case_sensitive => false }

private
  
  def check_maximum
    if User.count >= USERS_MAX
      raise "Maximum number of users reached!"
    end
  end
end
