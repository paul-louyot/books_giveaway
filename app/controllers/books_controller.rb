class BooksController < ApplicationController
  http_basic_authenticate_with name: "paul", password: "secret", except: [ :index, :update ]

  def index
    @books = Book.all
    @user_name = cookies[:user_name]
  end

  def create
    params[:message].split("\n").each do |line|
      title, author = line.split(",")
      Book.create(title: title, author: author)
    end
  end

  def update
    book = Book.find_by(id: params[:id])
    book.update!(book_params)
  end

  def new
  end

  private

  def book_params
    params.require(:book).permit(:user_name)
  end
end
