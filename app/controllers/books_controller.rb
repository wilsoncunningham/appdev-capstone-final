require "http"
require "json"
require "dotenv/load"

class BooksController < ApplicationController
  def index
    matching_books = Book.all

    @list_of_books = matching_books.order({ :created_at => :desc })

    @ot_books_list = Book.where({:testament => "old"})
    @nt_books_list = Book.where({:testament => "new"})

    render({ :template => "books/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_books = Book.where({ :id => the_id })

    @the_book = matching_books.at(0)

    render({ :template => "books/show" })
  end

  def create
    the_book = Book.new
    the_book.title = params.fetch("query_title")
    the_book.testament = params.fetch("query_testament")
    the_book.description = params.fetch("query_description")
    the_book.total_chapters = params.fetch("query_total_chapters")
    the_book.current_readers_count = params.fetch("query_current_readers_count")

    if the_book.valid?
      the_book.save
      redirect_to("/books", { :notice => "Book created successfully." })
    else
      redirect_to("/books", { :alert => the_book.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_book = Book.where({ :id => the_id }).at(0)

    the_book.title = params.fetch("query_title")
    the_book.testament = params.fetch("query_testament")
    the_book.description = params.fetch("query_description")
    the_book.total_chapters = params.fetch("query_total_chapters")
    the_book.current_readers_count = params.fetch("query_current_readers_count")

    if the_book.valid?
      the_book.save
      redirect_to("/books/#{the_book.id}", { :notice => "Book updated successfully."} )
    else
      redirect_to("/books/#{the_book.id}", { :alert => the_book.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_book = Book.where({ :id => the_id }).at(0)

    the_book.destroy

    redirect_to("/books", { :notice => "Book deleted successfully."} )
  end

  def read_book
    book_id = params.fetch("book_id")
    @book = Book.find(book_id)
    render({:template => "/reading/book"})
  end


  def read_chapter
    book_id = params.fetch("book_id")
    @book = Book.find(book_id)
    @chapter_number = params.fetch("chapter_number").to_i

    esv_api_key = ENV.fetch("ESV_API_KEY") 
    api_url = "https://api.esv.org/v3/passage/html/"


    params = {
      "q": @book.title + " " + @chapter_number.to_s,
      "include-headings": true,
      "include-footnotes": true,
      "include-footnote-body": true,
      "include-verse-numbers": true,
      "include-short-copyright": true,
      "include-passage-references": true,
      "include-css-link": true,
      "inline-styles": false,
      "wrapping-div": false,
      "div-classes": false,
      "include-chapter-numbers": false,
      "include-crossrefs": false
    }

    # book_id = Book.where({:title => @book_title.capitalize})[0].id
    # chapter = Chapter.where({:book_id => book_id, :number => @chapter_number})[0]

    # params = chapter.content

    headers = {
        "Authorization": "Token #{esv_api_key}"
    }

    response = HTTP.headers(headers).get(api_url, params: params)

    body = JSON.parse(response.body.to_s)
    @passage = body["passages"][0]

    # passages.any? ? passages[0].strip : "Error: Passage not found"

    render({:template => "/chapters/read"})
  end

end
