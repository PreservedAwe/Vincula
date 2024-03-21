class FindController < ApplicationController
    before_action :valid_user

    def index
      @current_user = User.find(session[:user_id])
      render "mainpage/find/index"
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
