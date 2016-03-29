class Project < ActiveRecord::Base
  belongs_to :admin
  has_many :users
   accepts_nested_attributes_for :users

end
