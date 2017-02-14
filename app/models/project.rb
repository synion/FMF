class Project < ActiveRecord::Base
  has_many :switchgears, dependent: :destroy
  has_many :users
  belongs_to :admin
  accepts_nested_attributes_for :switchgears, reject_if: lambda { |a| a[:description].blank? }, allow_destroy: true
  accepts_nested_attributes_for :users

  def form_switchgears
    self.switchgears.build
  end
end

