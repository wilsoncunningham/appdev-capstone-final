class SubscriptionsController < ApplicationController
  def index
    matching_subscriptions = Subscription.all

    @list_of_subscriptions = matching_subscriptions.order({ :created_at => :desc })

    render({ :template => "subscriptions/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_subscriptions = Subscription.where({ :id => the_id })

    @the_subscription = matching_subscriptions.at(0)

    render({ :template => "subscriptions/show" })
  end

  def create
    the_subscription = Subscription.new
    the_subscription.user_id = params.fetch("query_user_id")
    the_subscription.plan_id = params.fetch("query_plan_id")

    if the_subscription.valid?
      the_subscription.save
      redirect_to("/subscriptions", { :notice => "Subscription created successfully." })
    else
      redirect_to("/subscriptions", { :alert => the_subscription.errors.full_messages.to_sentence })
    end
  end

  #########################
  def subscribe
    the_subscription = Subscription.new
    the_subscription.user_id = current_user.id
    the_subscription.plan_id = params.fetch("reading_plan_id")

    if the_subscription.valid?
      the_subscription.save
      redirect_to("/reading_plans", { :notice => "Subscription created successfully." })
    else
      redirect_to("/reading_plans", { :alert => the_subscription.errors.full_messages.to_sentence })
    end
  end

  def unsubscribe
    the_subscription = Subscription.where( { :user_id => current_user.id, :plan_id => params.fetch("reading_plan_id") })[0]

    the_subscription.destroy

    redirect_to("/reading_plans", { :alert => the_subscription.errors.full_messages.to_sentence })
  end
  ########################

  def update
    the_id = params.fetch("path_id")
    the_subscription = Subscription.where({ :id => the_id }).at(0)

    the_subscription.user_id = params.fetch("query_user_id")
    the_subscription.plan_id = params.fetch("query_plan_id")

    if the_subscription.valid?
      the_subscription.save
      redirect_to("/subscriptions/#{the_subscription.id}", { :notice => "Subscription updated successfully."} )
    else
      redirect_to("/subscriptions/#{the_subscription.id}", { :alert => the_subscription.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_subscription = Subscription.where({ :id => the_id }).at(0)

    the_subscription.destroy

    redirect_to("/subscriptions", { :notice => "Subscription deleted successfully."} )
  end
end
