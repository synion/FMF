class Fibre < ActiveRecord::Base
  belongs_to :otdf
  geocoded_by :address
  after_validation :geocode
end
