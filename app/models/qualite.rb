class Qualite < ActiveRecord::Base
  validates_presence_of :name
end


# == Schema Information
# Schema version: 20100105082615
#
# Table name: qualites
#
#  id   :integer         not null, primary key
#  name :string(255)
#

