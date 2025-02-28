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
end
