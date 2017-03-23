FactoryGirl.define do
  factory :field, class: 'Kms::Field' do
    name 'Name'
    liquor_name 'name'
    type Kms::StringField.name
    factory :has_many_field do
      type Kms::HasManyField.name
      name 'Comments'
      liquor_name 'comments'
      class_name { FactoryGirl.create(:associated_model).id }
    end
  end
end
