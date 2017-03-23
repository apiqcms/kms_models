FactoryGirl.define do
  factory :model, class: 'Kms::Model' do
    kms_model_name 'Posts'
    collection_name 'posts'
    label_field 'name'
    factory :model_with_string_field do
      after(:create) do |model, evaluator|
        create_list(:field, 1, model: model)
      end
      factory :model_allowing_creation do
        allow_creation_using_form true
      end

      factory :associated_model do
        kms_model_name 'Comments'
        collection_name 'comments'
      end
    end
    factory :model_with_has_many_field do
      after(:create) do |model, evaluator|
        create_list(:has_many_field, 1, model: model)
      end
    end
  end
end
