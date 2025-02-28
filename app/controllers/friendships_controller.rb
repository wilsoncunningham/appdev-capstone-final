class FriendshipsController < ApplicationController
  def index
    matching_friendships = Friendship.all

    @list_of_friendships = matching_friendships.order({ :created_at => :desc })

    render({ :template => "friendships/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_friendships = Friendship.where({ :id => the_id })

    @the_friendship = matching_friendships.at(0)

    render({ :template => "friendships/show" })
  end

  def create
    the_friendship = Friendship.new
    the_friendship.user1_id = params.fetch("query_user1_id")
    the_friendship.user2_id = params.fetch("query_user2_id")
    the_friendship.status = params.fetch("query_status")

    if the_friendship.valid?
      the_friendship.save
      redirect_to("/friendships", { :notice => "Friendship created successfully." })
    else
      redirect_to("/friendships", { :alert => the_friendship.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_friendship = Friendship.where({ :id => the_id }).at(0)

    the_friendship.user1_id = params.fetch("query_user1_id")
    the_friendship.user2_id = params.fetch("query_user2_id")
    the_friendship.status = params.fetch("query_status")

    if the_friendship.valid?
      the_friendship.save
      redirect_to("/friendships/#{the_friendship.id}", { :notice => "Friendship updated successfully."} )
    else
      redirect_to("/friendships/#{the_friendship.id}", { :alert => the_friendship.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_friendship = Friendship.where({ :id => the_id }).at(0)

    the_friendship.destroy

    redirect_to("/friendships", { :notice => "Friendship deleted successfully."} )
  end
end
