class ApplicationController < ActionController::Base
    helper_method :has_permission
    protect_from_forgery with: :exception
    before_action :authenticate_user!
    def after_sign_in_path_for(resource)
        request.env['omniauth.origin'] || root_path
    end

    # def show 
    #     @connections = Connection.all 
    #     @person_of_interest = PersonOfInterest.new 
    #     @connection = Connection.new 
    #     render 'users/show'
    # end
    def has_permission(object)
        object.user == current_user 
    end
end
