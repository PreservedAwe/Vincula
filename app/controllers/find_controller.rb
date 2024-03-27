class FindController < ApplicationController
    before_action :valid_user

    def index
      render "mainpage/find/index"
    end

    def view_profile
      if session[:searched]
        @current_user = User.find(session[:searched])
        render "mainpage/find/view_profile"
      else
        redirect_to "/find"
      end
    end

    def search
      if User.exists?(username: params[:username])
        session[:searched] = User.find_by(username: params[:username]).id
        redirect_to "/view_searched"
      else
        redirect_to "/find", notice: "There is no user with that username" 
      end
    end
end
