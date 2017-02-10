Kms::Models::Engine.routes.draw do
  constraints(format: "json") do
    resources :models, format: true do
      resources :entries, format: true do
        member do
          post '' => 'entries#update'
        end
      end
    end
  end
end
Rails.application.routes.draw do
  post '/entries/:collection_name' => 'kms/public/entries#create'
end
