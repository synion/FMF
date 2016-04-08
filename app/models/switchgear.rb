class Switchgear < ActiveRecord::Base
  belongs_to :project
  has_many :otdfs, dependent: :destroy
  accepts_nested_attributes_for :otdfs, allow_destroy: true
end
