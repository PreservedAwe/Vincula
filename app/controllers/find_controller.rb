class FindController < ApplicationController
    def index
        if session[:user_id]
          @current_user = User.find(session[:user_id])
          render "mainpage/find/index"
        else  
          redirect_to "/log_in"
        end  
      end

      def search
        user = User.find_by(username: params[:username])
        if user
          @searched_member = user
          flash[:notice] = "User found."
          redirect_to "/find"
        else
          @searched_member = nil
          flash[:alert] = "User not found."
          redirect_to "/find"
        end
      end
end
