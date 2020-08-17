class Connection < ApplicationRecord
    belongs_to :user 
    belongs_to :person_of_interest
    accepts_nested_attributes_for :person_of_interest
    
    
    validates :description, presence: true 
    validates_associated :person_of_interest
    
    
    
    def Person_of_interest_name=(attributes)
        self.personofinterest = PersonOfInterest.find_or_create_by(attributes)
      end
    
      def person_of_interest_name
         self.personofinterest ? self.personofinterest.name : nil
      end
end
