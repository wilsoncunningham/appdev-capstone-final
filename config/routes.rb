Rails.application.routes.draw do
  # Routes for the User chapter resource:

  # CREATE
  post("/insert_user_chapter", { :controller => "user_chapters", :action => "create" })
          
  # READ
  get("/user_chapters", { :controller => "user_chapters", :action => "index" })
  
  get("/user_chapters/:path_id", { :controller => "user_chapters", :action => "show" })
  
  # UPDATE
  
  post("/modify_user_chapter/:path_id", { :controller => "user_chapters", :action => "update" })
  
  # DELETE
  get("/delete_user_chapter/:path_id", { :controller => "user_chapters", :action => "destroy" })

  #------------------------------

  # Routes for the Reading plan content resource:

  # CREATE
  post("/insert_reading_plan_content", { :controller => "reading_plan_contents", :action => "create" })
          
  # READ
  get("/reading_plan_contents", { :controller => "reading_plan_contents", :action => "index" })
  
  get("/reading_plan_contents/:path_id", { :controller => "reading_plan_contents", :action => "show" })
  
  # UPDATE
  
  post("/modify_reading_plan_content/:path_id", { :controller => "reading_plan_contents", :action => "update" })
  
  # DELETE
  get("/delete_reading_plan_content/:path_id", { :controller => "reading_plan_contents", :action => "destroy" })

  #------------------------------

  # Routes for the Verse resource:

  # CREATE
  post("/insert_verse", { :controller => "verses", :action => "create" })
          
  # READ
  get("/verses", { :controller => "verses", :action => "index" })
  
  get("/verses/:path_id", { :controller => "verses", :action => "show" })
  
  # UPDATE
  
  post("/modify_verse/:path_id", { :controller => "verses", :action => "update" })
  
  # DELETE
  get("/delete_verse/:path_id", { :controller => "verses", :action => "destroy" })

  #------------------------------

  # Routes for the User book resource:

  # CREATE
  post("/insert_user_book", { :controller => "user_books", :action => "create" })
          
  # READ
  get("/user_books", { :controller => "user_books", :action => "index" })
  
  get("/user_books/:path_id", { :controller => "user_books", :action => "show" })
  
  # UPDATE
  
  post("/modify_user_book/:path_id", { :controller => "user_books", :action => "update" })
  
  # DELETE
  get("/delete_user_book/:path_id", { :controller => "user_books", :action => "destroy" })

  #------------------------------

  # Routes for the Reading plan resource:

  # CREATE
  post("/insert_reading_plan", { :controller => "reading_plans", :action => "create" })
          
  # READ
  get("/reading_plans", { :controller => "reading_plans", :action => "index" })
  
  get("/reading_plans/:path_id", { :controller => "reading_plans", :action => "show" })
  
  # UPDATE
  
  post("/modify_reading_plan/:path_id", { :controller => "reading_plans", :action => "update" })
  
  # DELETE
  get("/delete_reading_plan/:path_id", { :controller => "reading_plans", :action => "destroy" })

  #------------------------------

  # Routes for the Friendship resource:

  # CREATE
  post("/insert_friendship", { :controller => "friendships", :action => "create" })
          
  # READ
  get("/friendships", { :controller => "friendships", :action => "index" })
  
  get("/friendships/:path_id", { :controller => "friendships", :action => "show" })
  
  # UPDATE
  
  post("/modify_friendship/:path_id", { :controller => "friendships", :action => "update" })
  
  # DELETE
  get("/delete_friendship/:path_id", { :controller => "friendships", :action => "destroy" })

  #------------------------------

  # Routes for the Chapter resource:

  # CREATE
  post("/insert_chapter", { :controller => "chapters", :action => "create" })
          
  # READ
  get("/chapters", { :controller => "chapters", :action => "index" })
  
  get("/chapters/:path_id", { :controller => "chapters", :action => "show" })
  
  # UPDATE
  
  post("/modify_chapter/:path_id", { :controller => "chapters", :action => "update" })
  
  # DELETE
  get("/delete_chapter/:path_id", { :controller => "chapters", :action => "destroy" })

  #------------------------------

  # Routes for the Book resource:

  # CREATE
  post("/insert_book", { :controller => "books", :action => "create" })
          
  # READ
  get("/books", { :controller => "books", :action => "index" })
  
  get("/books/:path_id", { :controller => "books", :action => "show" })
  
  # UPDATE
  
  post("/modify_book/:path_id", { :controller => "books", :action => "update" })
  
  # DELETE
  get("/delete_book/:path_id", { :controller => "books", :action => "destroy" })

  #------------------------------

  devise_for :users

  # This is a blank app! Pick your first screen, build out the RCAV, and go from there. E.g.:

  # get "/your_first_screen" => "pages#first"

  root "boards#index"
  
end
