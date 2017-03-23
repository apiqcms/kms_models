require 'spec_helper'

module Kms
  describe Field, type: :model do
    it { should belong_to(:model) }
    describe '#get_value' do
      it 'returns value stored in entry' do
        model = FactoryGirl.create(:model_with_string_field)
        field = model.fields.first
        entry = model.entries.create(values: {name: 'Test'})
        expect(field.get_value(entry)).to be_eql('Test')
      end
    end
  end
end
