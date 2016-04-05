class Otdf < ActiveRecord::Base
  belongs_to :switchgear
  self.inheritance_column = nil
end
