class PromptsController < ApplicationController
    before_action :set_prompt, only: [:show, :edit, :update, :destroy]
    def index 
        @prompts = current_user.prompts.all
    end
    def show 
        
    end
    def new 
        @prompt = Prompt.new 
    end
    def create 
        @prompt = Prompt.new(prompt_params)
        if @prompt.save 
            redirect_to person_of_interest_path(@prompt.person_of_interest)
        else 
            flash.now[:errors] = "please make sure each field is filled out correctly"
            redirect_to person_of_interest_path
        end
    end
    def edit 

    end
    def update 

    end
    def destroy 

    end

    private 
    def set_prompt
        @prompt = Prompt.find(params[:id])
    end
    def prompt_params
        params.require(:prompt).permit(:person_of_interest_id, :user_id, :description, :due_date, :notes)

    end
    def set_person_of_interest
        @person_of_interest = PersonOfInterest.find(params[:person_of_interest_id])
    end


end
