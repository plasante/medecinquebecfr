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

require 'spec_helper'

describe User do
  before(:each) do
    @attr = { :first_name => "Pierre", :last_name => "Lasante", :email => "plasante@email.com" }
  end
  
  it "should create a new instance given valid attributes" do
    User.create!(@attr)
  end
  
  it "should require a first_name" do
    no_first_name_user = User.new(@attr.merge(:first_name => ""))
    no_first_name_user.should_not be_valid
  end
  
  it "should reject first_name too long" do
    long_first_name = "a" * 51
    long_first_name_user = User.new(@attr.merge(:first_name => long_first_name))
    long_first_name_user.should_not be_valid
  end
  
  it "should require a last name" do
    no_last_name_user = User.new(@attr.merge(:last_name => ""))
    no_last_name_user.should_not be_valid
  end
  
  it "should reject last_name that are too long" do
    long_last_name = "a" * 51
    long_last_name_user = User.new(@attr.merge(:last_name => long_last_name))
    long_last_name_user.should_not be_valid
  end
  
end
