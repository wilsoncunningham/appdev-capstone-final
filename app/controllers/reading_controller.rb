class ReadingController < ApplicationController
  def index
    matching_books = Book.all

    @list_of_books = matching_books.order({ :bible_position => :asc })

    @ot_books_list = Book.where({:testament => "old"})
    @nt_books_list = Book.where({:testament => "new"})

    render({ :template => "read/index" })
  end
end
