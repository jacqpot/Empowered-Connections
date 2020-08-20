class PersonOfInterest < ApplicationRecord
    has_many :connections, dependent: :destroy 
    has_many :users, through: :connections 
    has_many :prompts, dependent: :destroy 
    validates :name, presence: true
    validates :email, presence: true
    validates :phone_number, length: { is: 10}
   validates :occupation, presence: true 
    validates :goals, presence: true


end
