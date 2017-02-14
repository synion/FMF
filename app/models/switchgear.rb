class Switchgear < ActiveRecord::Base
	belongs_to :project
  has_many :otdfs, dependent: :destroy
end
