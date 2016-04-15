Rails.application.routes.draw do
  get "/webhook", to: "bot#index"
  post "/webhook", to: "bot#webhook"
end
