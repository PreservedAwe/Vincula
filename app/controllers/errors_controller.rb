class ErrorsController < ApplicationController
  def index
    render status: :not_found 
    render "errors/index"
  end
end
