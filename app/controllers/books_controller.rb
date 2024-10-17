class BooksController < ApplicationController
  http_basic_authenticate_with name: "paul", password: "secret", except: [ :index, :update ]

  def index
  end

  def create
    books = params[:message]
  end

  def update
  end

  def new
  end
end
