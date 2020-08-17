class ConnectionsController < ApplicationController
    
    def new 
        @connection = Connection.new
    end
    def create 
        @connection = Connection.new(connection_params)
        if @connection.save 
            redirect_to 'application#show'

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
    
      def Connection_params
        params.require(:Connection).permit(:type)
      end
end