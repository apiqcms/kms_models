Rails.application.routes.draw do
  mount Kms::Models::Engine => '/kms'
end
