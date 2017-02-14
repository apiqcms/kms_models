FactoryGirl.define do
  factory :model, class: 'Kms::Model' do
    kms_model_name 'Posts'
    collection_name 'posts'
    label_field 'name'
    after(:create) do |model, evaluator|
      create_list(:field, 1, model: model)
    end
    factory :model_allowing_creation do
      allow_creation_using_form true
    end
  end
end
