class UserBooksController < ApplicationController
  def index
    matching_user_books = UserBook.all

    @list_of_user_books = matching_user_books.order({ :created_at => :desc })

    render({ :template => "user_books/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_user_books = UserBook.where({ :id => the_id })

    @the_user_book = matching_user_books.at(0)

    render({ :template => "user_books/show" })
  end

  def create
    the_user_book = UserBook.new
    the_user_book.user_id = params.fetch("query_user_id")
    the_user_book.book_id = params.fetch("query_book_id")
    the_user_book.completed_at = params.fetch("query_completed_at")
    the_user_book.status = params.fetch("query_status")

    if the_user_book.valid?
      the_user_book.save
      redirect_to("/user_books", { :notice => "User book created successfully." })
    else
      redirect_to("/user_books", { :alert => the_user_book.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_user_book = UserBook.where({ :id => the_id }).at(0)

    the_user_book.user_id = params.fetch("query_user_id")
    the_user_book.book_id = params.fetch("query_book_id")
    the_user_book.completed_at = params.fetch("query_completed_at")
    the_user_book.status = params.fetch("query_status")

    if the_user_book.valid?
      the_user_book.save
      redirect_to("/user_books/#{the_user_book.id}", { :notice => "User book updated successfully."} )
    else
      redirect_to("/user_books/#{the_user_book.id}", { :alert => the_user_book.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_user_book = UserBook.where({ :id => the_id }).at(0)

    the_user_book.destroy

    redirect_to("/user_books", { :notice => "User book deleted successfully."} )
  end
end
