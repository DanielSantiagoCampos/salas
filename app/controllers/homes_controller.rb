class HomesController < ApplicationController
  def index
    session[:user_id] = User.find_by(role: 'visitor').id if params[:sign_by_visitor]
  end
end
