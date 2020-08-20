class PersonOfInterestsController < ApplicationController
    before_action :set_person_of_interest, only: [:show, :destroy, :edit, :update]
    def show
        @prompt = Prompt.new 
    end
    def index 
        
    end
    def new

    end
    def create 

    end
    def edit 
        
    end
    def update 
        if @person_of_interest.update(person_of_interest_params)
        redirect_to person_of_interest_path(@person_of_interest)
        else
        flash.now[:errors] = "please make sure each field is filled out correctly"
        render :edit
        end 
    end

    def destroy
        @person_of_interest.destroy
        redirect_to connections_path

    end
    private 

    def set_person_of_interest
        @person_of_interest = PersonOfInterest.find(params[:id])
    end
    def person_of_interest_params
        params.require(:person_of_interest).permit(:name, :email, :phone_number, :occupation, :goals, :connection)

    end
end
