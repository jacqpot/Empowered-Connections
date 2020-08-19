class ConnectionsController < ApplicationController
     before_action :set_connection, only: [:show, :edit, :update, :destroy] 
    def home 
        if  current_user
            @work = current_user.connections.where(description: "Work")
            @connections = current_user.connections
            @current_user = current_user
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
end