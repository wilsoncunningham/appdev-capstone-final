class ReadingPlansController < ApplicationController
  def index
    matching_reading_plans = ReadingPlan.all

    @list_of_reading_plans = matching_reading_plans.order({ :created_at => :desc })

    render({ :template => "reading_plans/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_reading_plans = ReadingPlan.where({ :id => the_id })

    @the_reading_plan = matching_reading_plans.at(0)

    render({ :template => "reading_plans/show" })
  end

  def create
    the_reading_plan = ReadingPlan.new
    the_reading_plan.title = params.fetch("query_title")
    the_reading_plan.description = params.fetch("query_description")

    if the_reading_plan.valid?
      the_reading_plan.save
      redirect_to("/reading_plans", { :notice => "Reading plan created successfully." })
    else
      redirect_to("/reading_plans", { :alert => the_reading_plan.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_reading_plan = ReadingPlan.where({ :id => the_id }).at(0)

    the_reading_plan.title = params.fetch("query_title")
    the_reading_plan.description = params.fetch("query_description")

    if the_reading_plan.valid?
      the_reading_plan.save
      redirect_to("/reading_plans/#{the_reading_plan.id}", { :notice => "Reading plan updated successfully."} )
    else
      redirect_to("/reading_plans/#{the_reading_plan.id}", { :alert => the_reading_plan.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_reading_plan = ReadingPlan.where({ :id => the_id }).at(0)

    the_reading_plan.destroy

    redirect_to("/reading_plans", { :notice => "Reading plan deleted successfully."} )
  end

  def read_plan
    @plan = ReadingPlan.find(params.fetch("plan_id"))
    render({ :template => "/reading_plans/read"})
  end

  def read_plan_chapter
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
end
