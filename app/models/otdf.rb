class Otdf < ActiveRecord::Base
  belongs_to :switchgear
  has_many :fibres
end
