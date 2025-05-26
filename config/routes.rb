Rails.application.routes.draw do
  # Routes for the Post resource:

  # CREATE
  post("/insert_post", { :controller => "posts", :action => "create" })
          
  # READ
  get("/posts", { :controller => "posts", :action => "index" })
  
  get("/posts/:path_id", { :controller => "posts", :action => "show" })
  
  # UPDATE
  
  post("/modify_post/:path_id", { :controller => "posts", :action => "update" })
  
  # DELETE
  get("/delete_post/:path_id", { :controller => "posts", :action => "destroy" })

  #------------------------------

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :boards do
    resources :posts, only: [:create]
  end

  resources :posts, only: [:index, :show, :edit, :update, :destroy]

  root "boards#index"
end
  # Defines the root path route ("/")
  # root "articles#index"
