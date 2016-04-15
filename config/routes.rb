Rails.application.routes.draw do
  get "/", to: "bot#index"
  post "/", to: "bot#webhook"
  get "/webhook/", to: "bot#index"
  post "/webhook", to: "bot#webhook"
  #scope '/hooks', :controller => :hooks do
  #    post :survey_created_callback
  #end
end
