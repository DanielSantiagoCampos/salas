class LoginsController < ApplicationController
  def show
    @user = User.new
  end

  def create
    puts "*" * 100
    email = params[:email]
    password = params[:password]

    User.find(email: email, password: password)
  end
end
