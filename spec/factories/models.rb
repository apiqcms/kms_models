FactoryGirl.define do
  factory :model, class: 'Kms::Model' do
    kms_model_name 'Posts'
    collection_name 'posts'
  end
end
