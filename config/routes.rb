Rails.application.routes.draw do

  devise_for :users
  root "home#index"
  
  # Routes for the Subscription resource:

  get("/subscriptions", { :controller => "subscriptions", :action => "index" })
  get("/subscriptions/:path_id", { :controller => "subscriptions", :action => "show" })
  post("/modify_subscription/:path_id", { :controller => "subscriptions", :action => "update" })
  get("/delete_subscription/:path_id", { :controller => "subscriptions", :action => "destroy" })

  post("/insert_subscription", { :controller => "subscriptions", :action => "create" })
  post("/reading_plans/subscribe/:reading_plan_id", { :controller => "subscriptions", :action => "subscribe" })
  post("/reading_plans/unsubscribe/:reading_plan_id", { :controller => "subscriptions", :action => "unsubscribe" })

  #------------------------------

  ######################################

  get("/", {:controller => "home", :action => "index"})

  get("/books", {:controller => "books", :action => "index"})
  get("/books/:book_id/", {:controller => "books", :action => "read_book"})
  get("/books/:book_id/:chapter_number", {:controller => "chapters", :action => "read_chapter_vanilla"})

  get("/reading_plans", {:controller => "reading_plans", :action => "index"})
  get("/reading_plans/:plan_id/read", {:controller => "reading_plans", :action => "read_plan"})
  get("/reading_plans/:plan_id/read/:book_id/:chapter_number", {:controller => "chapters", :action => "read_chapter_plan"})
  
  post("/complete_chapter/:plan_id/:book_id/:chapter_id", {:controller => "user_chapters", :action => "complete_chapter"})

  ######################################


  # Routes for the User chapter resource:

  post("/insert_user_chapter", { :controller => "user_chapters", :action => "create" })
  get("/user_chapters", { :controller => "user_chapters", :action => "index" })
  get("/user_chapters/:path_id", { :controller => "user_chapters", :action => "show" })
  post("/modify_user_chapter/:path_id", { :controller => "user_chapters", :action => "update" })
  get("/delete_user_chapter/:path_id", { :controller => "user_chapters", :action => "destroy" })

  #------------------------------

  # Routes for the Reading plan content resource:

  post("/insert_reading_plan_content", { :controller => "reading_plan_contents", :action => "create" })
  get("/reading_plan_contents", { :controller => "reading_plan_contents", :action => "index" })
  get("/reading_plan_contents/:path_id", { :controller => "reading_plan_contents", :action => "show" })
  post("/modify_reading_plan_content/:path_id", { :controller => "reading_plan_contents", :action => "update" })
  get("/delete_reading_plan_content/:path_id", { :controller => "reading_plan_contents", :action => "destroy" })

  #------------------------------

  # Routes for the Verse resource:

  post("/insert_verse", { :controller => "verses", :action => "create" })  
  get("/verses", { :controller => "verses", :action => "index" })
  get("/verses/:path_id", { :controller => "verses", :action => "show" })
  post("/modify_verse/:path_id", { :controller => "verses", :action => "update" })
  get("/delete_verse/:path_id", { :controller => "verses", :action => "destroy" })

  #------------------------------

  # Routes for the User book resource:

  
  post("/insert_user_book", { :controller => "user_books", :action => "create" })
  get("/user_books", { :controller => "user_books", :action => "index" })
  get("/user_books/:path_id", { :controller => "user_books", :action => "show" })
  post("/modify_user_book/:path_id", { :controller => "user_books", :action => "update" })
  get("/delete_user_book/:path_id", { :controller => "user_books", :action => "destroy" })

  #------------------------------

  # Routes for the Reading plan resource:

  
  post("/insert_reading_plan", { :controller => "reading_plans", :action => "create" })
  get("/reading_plans", { :controller => "reading_plans", :action => "index" })
  get("/reading_plans/:path_id", { :controller => "reading_plans", :action => "show" })
  post("/modify_reading_plan/:path_id", { :controller => "reading_plans", :action => "update" })
  get("/delete_reading_plan/:path_id", { :controller => "reading_plans", :action => "destroy" })

  #------------------------------

  # Routes for the Friendship resource:

  post("/insert_friendship", { :controller => "friendships", :action => "create" })
  get("/friendships", { :controller => "friendships", :action => "index" })
  get("/friendships/:path_id", { :controller => "friendships", :action => "show" })
  post("/modify_friendship/:path_id", { :controller => "friendships", :action => "update" })
  get("/delete_friendship/:path_id", { :controller => "friendships", :action => "destroy" })

  #------------------------------

  # Routes for the Chapter resource:

  post("/insert_chapter", { :controller => "chapters", :action => "create" })
  get("/chapters", { :controller => "chapters", :action => "index" })
  get("/chapters/:path_id", { :controller => "chapters", :action => "show" })
  post("/modify_chapter/:path_id", { :controller => "chapters", :action => "update" })
  get("/delete_chapter/:path_id", { :controller => "chapters", :action => "destroy" })

  #------------------------------

  # Routes for the Book resource:

  post("/insert_book", { :controller => "books", :action => "create" })
  # get("/books", { :controller => "books", :action => "index" })
  get("/books/:path_id", { :controller => "books", :action => "show" })
  post("/modify_book/:path_id", { :controller => "books", :action => "update" })
  get("/delete_book/:path_id", { :controller => "books", :action => "destroy" })

  #------------------------------

  get("/read", { :controller => "reading", :action => "index"})

  
end
