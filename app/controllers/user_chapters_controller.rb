class UserChaptersController < ApplicationController
  def index
    matching_user_chapters = UserChapter.all

    @list_of_user_chapters = matching_user_chapters.order({ :created_at => :desc })

    render({ :template => "user_chapters/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_user_chapters = UserChapter.where({ :id => the_id })

    @the_user_chapter = matching_user_chapters.at(0)

    render({ :template => "user_chapters/show" })
  end

  def create
    the_user_chapter = UserChapter.new
    the_user_chapter.chapter_id = params.fetch("query_chapter_id")
    the_user_chapter.user_id = params.fetch("query_user_id")
    the_user_chapter.completed_at = params.fetch("query_completed_at")
    the_user_chapter.status = params.fetch("query_status")
    the_user_chapter.reading_plan_id = params.fetch("query_reading_plan_id")

    if the_user_chapter.valid?
      the_user_chapter.save
      redirect_to("/user_chapters", { :notice => "User chapter created successfully." })
    else
      redirect_to("/user_chapters", { :alert => the_user_chapter.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_user_chapter = UserChapter.where({ :id => the_id }).at(0)

    the_user_chapter.chapter_id = params.fetch("query_chapter_id")
    the_user_chapter.user_id = params.fetch("query_user_id")
    the_user_chapter.completed_at = params.fetch("query_completed_at")
    the_user_chapter.status = params.fetch("query_status")
    the_user_chapter.reading_plan_id = params.fetch("query_reading_plan_id")

    if the_user_chapter.valid?
      the_user_chapter.save
      redirect_to("/user_chapters/#{the_user_chapter.id}", { :notice => "User chapter updated successfully."} )
    else
      redirect_to("/user_chapters/#{the_user_chapter.id}", { :alert => the_user_chapter.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_user_chapter = UserChapter.where({ :id => the_id }).at(0)

    the_user_chapter.destroy

    redirect_to("/user_chapters", { :notice => "User chapter deleted successfully."} )
  end

  def complete_chapter
    the_user_chapter = UserChapter.new

    the_chapter = Chapter.find(params.fetch("chapter_id"))
    the_plan = ReadingPlan.find(params.fetch("plan_id"))
    the_book = Book.find(params.fetch("book_id"))

    the_user_chapter.chapter_id = the_chapter.id
    the_user_chapter.user_id = current_user.id
    # the_user_chapter.completed_at = params.fetch("query_completed_at")
    # the_user_chapter.status = params.fetch("query_status")
    the_user_chapter.reading_plan_id = params.fetch("plan_id")

    chapter_number = the_chapter.number

    if the_user_chapter.valid?
      the_user_chapter.save
      redirect_to("/reading_plans/#{the_plan.id}/read/#{the_book.id}/#{chapter_number}", { :notice => "User chapter created successfully." })
    else
      redirect_to("/reading_plans/#{the_plan.id}/read/#{the_book.id}/#{chapter_number}", { :alert => the_user_chapter.errors.full_messages.to_sentence })
    end
  end
end
