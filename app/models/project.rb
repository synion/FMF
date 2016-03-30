class Project < ActiveRecord::Base
  belongs_to :admin
  has_many :users
  has_many :switchgear, dependent: :destroy
  accepts_nested_attributes_for :switchgear
  accepts_nested_attributes_for :users
  
end
