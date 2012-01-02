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
  
  attr_accessor   :password
  
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation
  
  validates :first_name, :presence   => true,
                         :length     => { :maximum => 50 }
  
  validates :last_name,  :presence   => true,
                         :length     => { :maximum => 50 }
                         
  validates :email,      :presence   => true,
                         :format     => { :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                         :uniqueness => { :case_sensitive => false }
                         
  validates :password,   :presence   => true,
                         :confirmation => true,
                         :length     => { :within => 6..40 }

  before_save :encrypt_password
  
  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end
  
  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil if user.nil?
    return user if user.has_password?(submitted_password)
    return nil
  end
  
private
  
  def check_maximum
    if User.count >= USERS_MAX
      raise "Maximum number of users reached!"
    end
  end
  
  def encrypt_password
    self.salt = make_salt unless has_password?(password)
    self.encrypted_password = encrypt(password)
  end
  
  def encrypt(string)
    secure_hash("#{salt}--#{string}")
  end
  
  def make_salt
    secure_hash("#{Time.now.utc}--#{password}")
  end
  
  def secure_hash(string)
    Digest::SHA2.hexdigest(string)
  end
end
