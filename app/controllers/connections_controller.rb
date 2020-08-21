class ConnectionsController < ApplicationController
     before_action :set_connection, only: [:edit, :update, :destroy] 
     before_action :due?, only: [:home]
    def home 
        @prompts = current_user.prompts.order("due_date")
    end
     
     def index 
        if  current_user
            @connections = current_user.connections
        else 
            @connections = Connection.all
        end
     end
        #@connections = current_user.connections
    

    def new 
        @connection = Connection.new
        @connection.build_person_of_interest
    end
    def create 
        @connection = current_user.connections.build(connection_params)
         
        if @connection.save 
            redirect_to connection_person_of_interest_path(@connection.id, @connection.person_of_interest.id)
        else 
            flash.now[:errors] = "please make sure each field is filled out correctly"
            render :new 

        end
    end
    def edit
    end
    
    def update

    if @connection.update(connection_params)
        redirect_to root 
    else
        flash.now[:errors] = "please make sure each field is filled out correctly"
            render :new
        render :edit
    end
    end

    def destroy
    @connection.destroy
    flash[:notice] = "Connection deleted."
    redirect_to 'application#show'
    end
    def work

        @connections = Connection.work
        render :index
    end
    def family
        @connections = Connection.family
        render :index
    end
    def friends
        @connections = Connection.friends
        render :index
    end
    def entrepenurship
        @connections = Connection.entrepenurship
        render :index
    end
    def church
        @connections = Connection.church 
        render :index
    end

    private
    def set_connection
        @connection = Connection.find(params[:id])
    end
    def connection_params
    params.require(:connection).permit(:description, user:[:current_user], person_of_interest_attributes: [:name, :email, :phone_number, :occupation, :goals])
    end
    def due? 
        current_user.prompts.each { |t| t.past_due }
    end
end