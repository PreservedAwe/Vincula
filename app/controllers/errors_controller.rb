class ErrorsController < ApplicationController
  def index
    render status: :not_found 
  end
end
