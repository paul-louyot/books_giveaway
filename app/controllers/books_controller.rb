class BooksController < ApplicationController
  http_basic_authenticate_with name: "paul", password: "secret", except: [ :index, :update ]

  def index
  end

  def create
    params[:message].split("\n").each do |line|
      title, author = line.split(",")
      Book.create(title: title, author: author)
    end
  end

  def update
  end

  def new
  end
end
