class PersonOfInterest < ApplicationRecord
    has_many :connections, dependent: :destroy 
    has_many :users, through: :connections 
    has_many :prompts
    validates :name, presence: true
    validates :email, presence: true
    validates :phone_number, presence: true
   validates :occupation, presence: true 
    validates :goals, presence: true


end
