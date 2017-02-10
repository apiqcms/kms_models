require 'spec_helper'

module Kms
  module Public
    describe EntriesController, type: :controller do
      describe '#create' do
        let(:model) { FactoryGirl.create(:model) }
        context 'when no model with provided collection name' do
          it 'returns 404' do
            expect { post :create, params: { collection_name: 'oops' }, format: :json }.to raise_exception(ActiveRecord::RecordNotFound)
          end
        end
        context 'when no validation errors' do
          it 'returns 204 status' do
            post :create, params: { collection_name: model.collection_name, entry: { name: 'Test' } }, format: :json
            expect(response).to have_http_status(204)
            expect(Kms::Entry.last.values.symbolize_keys).to include({ name: 'Test' })
          end
        end
      end
    end
  end
end
