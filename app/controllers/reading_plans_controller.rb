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
end
