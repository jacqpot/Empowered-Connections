class PersonOfInterest < ApplicationRecord
    has_many :connections 
    validates :name, presence: true
    validates :email, presence: true
    validates :phone_number, presence: true, default: 0000000000
   validates :occupation, presence: true 
    validates :goals, presence: true

end
