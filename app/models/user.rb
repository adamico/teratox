class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :login, :email, :password, :password_confirmation, :remember_me
end


# == Schema Information
# Schema version: 20101129094622
#
# Table name: users
#
#  id                 :integer         not null, primary key
#  email              :string(255)     default(""), not null
#  encrypted_password :string(128)     default(""), not null
#  password_salt      :string(255)     default(""), not null
#  sign_in_count      :integer         default(0)
#  current_sign_in_at :datetime
#  last_sign_in_at    :datetime
#  current_sign_in_ip :string(255)
#  last_sign_in_ip    :string(255)
#  login              :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  admin              :boolean
#

