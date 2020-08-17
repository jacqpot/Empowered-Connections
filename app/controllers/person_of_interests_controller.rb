class PersonOfInterestsController < ApplicationController
    def new

    end
    def create 

    end
    def show
        @person_of_interest = PersonOfInterest.find(params[:id])
    end
end
