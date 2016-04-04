class Project < ActiveRecord::Base

  belongs_to :admin
  has_many :switchgears, dependent: :destroy
  accepts_nested_attributes_for :switchgears, reject_if: lambda { |a| a[:content].blank? }, allow_destroy: true
  has_many :users
  accepts_nested_attributes_for :users
  
end
