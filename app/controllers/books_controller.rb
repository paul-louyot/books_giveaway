class BooksController < ApplicationController
  http_basic_authenticate_with name: "paul", password: "secret", only: [ :create, :new ]
  before_action :set_user
  before_action :set_book!, only: [ :claim, :unclaim ]

  def index
    redirect_to welcome_path and return unless @is_authenticated

    @books = Book.all
  end

  def create
    params[:message].split("\n").each do |line|
      title, author = line.split(",")
      Book.create(title: title, author: author)
    end
  end

  def claim
    @book.update!(user_name: @user_name)
    render partial: "form", locals: { book: @book, user_name: @user_name }
  end

  def unclaim
    @book.update!(user_name: nil)
    render partial: "form", locals: { book: @book, user_name: @user_name }
  end

  def new
  end

  private

  def set_book!
    @book = Book.find_by!(id: params[:id])
  end

  def set_user
    @user_name = cookies[:user_name]
    @is_authenticated = @user_name.present?
  end
end
