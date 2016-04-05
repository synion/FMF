class Switchgear < ActiveRecord::Base
  belongs_to :project
  has_many :otdfs, dependent: :destroy
  accepts_nested_attributes_for :otdfs, reject_if: lambda { |a| a[:content].blank? }, allow_destroy: true
end
