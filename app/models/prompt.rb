class Prompt < ApplicationRecord
    belongs_to :person_of_interest
    belongs_to :user 
    validates :description, presence: true
    validates :due_date, presence: true
    validates :notes, presence: true

    def past_due 
        if due_date.past? 
            self.destroy
        end
    end
end
