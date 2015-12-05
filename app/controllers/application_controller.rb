class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  respond_to :json

  def angular
    respond_to do |format|
      format.html { render 'layouts/application' }
    end
  end

end
