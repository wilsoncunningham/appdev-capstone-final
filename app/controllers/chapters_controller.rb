class ChaptersController < ApplicationController
  def index
    matching_chapters = Chapter.all

    @list_of_chapters = matching_chapters.order({ :created_at => :desc })

    render({ :template => "chapters/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_chapters = Chapter.where({ :id => the_id })

    @the_chapter = matching_chapters.at(0)

    render({ :template => "chapters/show" })
  end

  def create
    the_chapter = Chapter.new
    the_chapter.book_id = params.fetch("query_book_id")
    the_chapter.number = params.fetch("query_number")
    the_chapter.content = params.fetch("query_content")

    if the_chapter.valid?
      the_chapter.save
      redirect_to("/chapters", { :notice => "Chapter created successfully." })
    else
      redirect_to("/chapters", { :alert => the_chapter.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_chapter = Chapter.where({ :id => the_id }).at(0)

    the_chapter.book_id = params.fetch("query_book_id")
    the_chapter.number = params.fetch("query_number")
    the_chapter.content = params.fetch("query_content")

    if the_chapter.valid?
      the_chapter.save
      redirect_to("/chapters/#{the_chapter.id}", { :notice => "Chapter updated successfully."} )
    else
      redirect_to("/chapters/#{the_chapter.id}", { :alert => the_chapter.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_chapter = Chapter.where({ :id => the_id }).at(0)

    the_chapter.destroy

    redirect_to("/chapters", { :notice => "Chapter deleted successfully."} )
  end

  def read_chapter_vanilla
    book_id = params.fetch("book_id")
    @book = Book.find(book_id)
    @chapter_number = params.fetch("chapter_number").to_i

    esv_api_key = ENV.fetch("ESV_API_KEY") 
    api_url = "https://api.esv.org/v3/passage/html/"


    api_params = {
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

    response = HTTP.headers(headers).get(api_url, params: api_params)

    body = JSON.parse(response.body.to_s)
    @passage = body["passages"][0]

    # passages.any? ? passages[0].strip : "Error: Passage not found"

    render({:template => "/chapters/read"})
  end

  def read_chapter_plan
    book_id = params.fetch("book_id")
    @book = Book.find(book_id)
    @chapter_number = params.fetch("chapter_number").to_i
    @chapter = Chapter.where({ :book_id => @book.id, :number => @chapter_number })[0]
    @plan = ReadingPlan.find(params.fetch("plan_id"))
    @plan_books = @plan.books

    current_book_idx = @plan_books.index { |content| content.book_id == @book.id }
    if current_book_idx <= @plan_books.length - 2
      @next_book = Book.find(@plan_books[current_book_idx + 1].book_id)
    else
      @next_book = nil
    end
    
    if current_book_idx > 0
      @prev_book = Book.find(@plan_books[current_book_idx - 1].book_id)
    else
      @prev_book = nil
    end



    esv_api_key = ENV.fetch("ESV_API_KEY") 
    api_url = "https://api.esv.org/v3/passage/html/"


    api_params = {
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

    response = HTTP.headers(headers).get(api_url, params: api_params)

    body = JSON.parse(response.body.to_s)
    @passage = body["passages"][0]

    # passages.any? ? passages[0].strip : "Error: Passage not found"

    render({:template => "/reading_plans/read_chapter"})
  end

  # def query_navigate
  #   plan_id = params.fetch("plan_id")
  #   query_book_title = params.fetch("query_book_title")
  #   matching_book = Book.where({ :title => query_book_title.capitalize})[0]
  #   book_id = matching_book.id
  #   chapter_number = params.fetch("query_chapter_number")
  #   redirect_to("reading_plans/#{plan_id}/read/#{@book.id}/#{chapter_number}")
  # end

end
