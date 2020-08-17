class Connection < ApplicationRecord
    belongs_to :user 
    belongs to :person_of_interest
end
