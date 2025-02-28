class VersesController < ApplicationController
  def index
    matching_verses = Verse.all

    @list_of_verses = matching_verses.order({ :created_at => :desc })

    render({ :template => "verses/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_verses = Verse.where({ :id => the_id })

    @the_verse = matching_verses.at(0)

    render({ :template => "verses/show" })
  end

  def create
    the_verse = Verse.new
    the_verse.chapter_id = params.fetch("query_chapter_id")
    the_verse.number = params.fetch("query_number")
    the_verse.content = params.fetch("query_content")

    if the_verse.valid?
      the_verse.save
      redirect_to("/verses", { :notice => "Verse created successfully." })
    else
      redirect_to("/verses", { :alert => the_verse.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_verse = Verse.where({ :id => the_id }).at(0)

    the_verse.chapter_id = params.fetch("query_chapter_id")
    the_verse.number = params.fetch("query_number")
    the_verse.content = params.fetch("query_content")

    if the_verse.valid?
      the_verse.save
      redirect_to("/verses/#{the_verse.id}", { :notice => "Verse updated successfully."} )
    else
      redirect_to("/verses/#{the_verse.id}", { :alert => the_verse.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_verse = Verse.where({ :id => the_id }).at(0)

    the_verse.destroy

    redirect_to("/verses", { :notice => "Verse deleted successfully."} )
  end
end
