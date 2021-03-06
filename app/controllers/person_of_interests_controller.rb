class PersonOfInterestsController < ApplicationController
    before_action :set_person_of_interest, only: [:show, :destroy, :edit, :update]
    before_action :due?, only: [:show]
    def show
        if @person_of_interest.users.include?(current_user)
            @prompt = Prompt.new 
            @prompts = @person_of_interest.prompts.order('due_date asc')

        else
            redirect_to root_path
        end

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
    def due? 
       @person_of_interest.prompts.each { |t| t.past_due }
    end
    # def has_permission
    #     @person_of_interest = current_user.connections.where(person_of_interest_id == params[:id])
    # end

end
