class ReadingPlanContentsController < ApplicationController
  def index
    matching_reading_plan_contents = ReadingPlanContent.all

    @list_of_reading_plan_contents = matching_reading_plan_contents.order({ :created_at => :desc })

    render({ :template => "reading_plan_contents/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_reading_plan_contents = ReadingPlanContent.where({ :id => the_id })

    @the_reading_plan_content = matching_reading_plan_contents.at(0)

    render({ :template => "reading_plan_contents/show" })
  end

  def create
    the_reading_plan_content = ReadingPlanContent.new
    the_reading_plan_content.plan_id = params.fetch("query_plan_id")
    the_reading_plan_content.book_id = params.fetch("query_book_id")
    the_reading_plan_content.sequence = params.fetch("query_sequence")

    if the_reading_plan_content.valid?
      the_reading_plan_content.save
      redirect_to("/reading_plan_contents", { :notice => "Reading plan content created successfully." })
    else
      redirect_to("/reading_plan_contents", { :alert => the_reading_plan_content.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_reading_plan_content = ReadingPlanContent.where({ :id => the_id }).at(0)

    the_reading_plan_content.plan_id = params.fetch("query_plan_id")
    the_reading_plan_content.book_id = params.fetch("query_book_id")
    the_reading_plan_content.sequence = params.fetch("query_sequence")

    if the_reading_plan_content.valid?
      the_reading_plan_content.save
      redirect_to("/reading_plan_contents/#{the_reading_plan_content.id}", { :notice => "Reading plan content updated successfully."} )
    else
      redirect_to("/reading_plan_contents/#{the_reading_plan_content.id}", { :alert => the_reading_plan_content.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_reading_plan_content = ReadingPlanContent.where({ :id => the_id }).at(0)

    the_reading_plan_content.destroy

    redirect_to("/reading_plan_contents", { :notice => "Reading plan content deleted successfully."} )
  end
end
