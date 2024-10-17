class WelcomeController < ApplicationController
  def index
  end

  def sign_in
    cookies[:user_name] = params[:user_name]
    redirect_to books_path
  end
end
