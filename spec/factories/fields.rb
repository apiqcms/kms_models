FactoryGirl.define do
  factory :field, class: 'Kms::Field' do
    name 'Name'
    liquor_name 'name'
    type Kms::StringField.name
  end
end
