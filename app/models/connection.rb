class Connection < ApplicationRecord
    belongs_to :user 
    belongs to :person_of_interest
    validates :type, presence: true 

    def Person_of_interest_name=(name)
        self.personofinterest = PersonOfInterest.find_or_create_by(name: name)
      end
    
      def person_of_interest_name
         self.personofinterest ? self.personofinterest.name : nil
      end
end
