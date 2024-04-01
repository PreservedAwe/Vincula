class ApplicationController < ActionController::Base
    include ActiveStorage::Streaming
    
    def valid_user
        unless session[:user_id]
            # Redirect to another page or render a specific view
            redirect_to "/log_in"
          end
    end
end
