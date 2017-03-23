require 'spec_helper'

module Kms
  describe HasManyField, type: :model do
    describe '#get_value' do
      it 'returns drop scope containing association records' do
        model = FactoryGirl.create(:model_with_has_many_field)
        field = model.fields.first
        associated_model = Kms::Model.find(field.class_name)
        association_entry = associated_model.entries.create(values: {name: 'Test'})
        entry = model.entries.create(values: { comments: [association_entry.id] })
        expect(field.get_value(entry)).to be_instance_of(Kms::EntryDrop::Scope)
        expect(field.get_value(entry).source).to include(association_entry)
      end
    end
  end
end
