class ConnectionsController < ApplicationController
     before_action :set_connection, only: [:show, :edit, :update, :destroy] 
    def home 
        if  current_user
            @connections = current_user.connections
        else 
            @connections = Connection.all
        end
    end
     
     def index 
        if  current_user
            @connections = current_user.connections
        else 
            @connections = Connection.all
        end
     end
        #@connections = current_user.connections
    
    def show 

    end
    
    def new 
        @connection = Connection.new
        @connection.build_person_of_interest
    end
    def create 
        #@connection = current_user.connections.find_or_create_by(connection_params) 
        @connection = current_user.connections.build(connection_params)
        if @connection.save 
            redirect_to connection_person_of_interest_path(@connection.id, @connection.person_of_interest.id)
        else 
            render :new 

        end
    end
    def edit
    end
    
    def update

    if @connection.update(connection_params)
        redirect_to root 
    else
        render :edit
    end
    end

    def destroy
    @connection.destroy
    flash[:notice] = "Connection deleted."
    redirect_to 'application#show'
    end

    private
    def set_connection
        @connection = Connection.find(params[:id])
    end
    def connection_params
    params.require(:connection).permit(:description, user:[:current_user], person_of_interest_attributes: [:name, :email, :phone_number, :occupation, :goals])
    end
end