class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, 
        :recoverable, :rememberable, :trackable, :validatable
        has_many :users
        belongs_to :superadmin

         rails_admin do
    		configure :superadmin do
      			label 'Own this admin '
    		end
  		end

end
