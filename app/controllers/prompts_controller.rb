class PromptsController < ApplicationController
    before_action :set_prompt, only: [:show, :edit, :update, :destroy]
    def index 
        @prompts = current_user.prompts.all
    end

    def new 
        if params[:person_of_interest_id]
            set_person_of_interest
                new_prompt 
        else
            new_prompt 
        end

    end
    def create 
        if params[:person_of_interest_id]

            set_person_of_interest
            poi = @person_of_interest.dup
            @prompt = poi.build_prompt(prompt_params)

            if @prompt.save 
                redirect_to person_of_interest_path(@person_of_interest)
            else 
                render :new
            end
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
    def set_person_of_interest
        @person_of_interest = PersonOfInterest.find(params[:person_of_interest_id])
    end
    def new_prompt 
        @prompt = Prompt.new 
    end
    def prompt_params 
        params.require(:prompt).permit(:description, :due_date, :notes)
    end
end
