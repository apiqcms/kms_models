Rails.application.routes.draw do

  mount KmsModels::Engine => "/kms_models"
end
