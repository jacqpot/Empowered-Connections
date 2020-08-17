class ConnectionsController < ApplicationController
    def index 
        @connections = Connection.all 
    end
    def show 
        @connections = Connection.find_by(params[:id])
    end
    
    def new 
        @connection = Connection.new
        @connection.person_of_interest.new
    end
    def create 
        @connection = current_user.connections.new connection_params 
        #@connection = current_user.connections.build(connection_params)
        
        if @connection.save 
            redirect_to connection_path()

        end
    end
    def edit
        @connection = Connection.find(params[:id])
    end
    
    def update
    @connection = Connection.find(params[:id])

    @connection.update(connection_params)

    if @connection.save
        redirect_to 'application#show'
    else
        render :edit
    end
    end

    def destroy
    @connection = Connection.find(params[:id])
    @connection.destroy
    flash[:notice] = "Connection deleted."
    redirect_to 'application#show'
    end

    private
    def set_connection
        
    end
    def connection_params
    params.require(:connection).permit(:type, person_of_interest_attributes: [:name, :email, :phone_number, :occupation, :goals])
    end
end