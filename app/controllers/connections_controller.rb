class ConnectionsController < ApplicationController
    def index 

    end
    def show 

    end
    
    def new 
        @connection = Connection.new
    end
    def create 
        @connection = current_user.connections.build(connection_params)
        
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
    
      def connection_params
        params.require(:Connection).permit(:type, person_of_interest_id: [])
      end
end