require 'spec_helper'

module Kms
  module Models
    describe ModelsController, type: :controller do
      routes { Kms::Models::Engine.routes }

      login_user
      describe '#index' do
        it 'returns models json representation' do
          model = FactoryGirl.create(:model)
          get :index, format: :json

          expect(response).to be_success
          expect(json.length).to eq(1)
          expect(json[0].keys).to include('id', 'collection_name', 'kms_model_name', 'label_field')
        end
      end
      describe '#create' do
        context 'when validation failed' do
          it "returns errors" do
            post :create, params: { model: { kms_model_name: '' } }, format: :json
            expect(response.unprocessable?).to be true
            expect(json['errors']).to_not be nil
          end
        end
        context 'when valid' do
          it "returns model json" do
            post :create, params: { model: { kms_model_name: 'Posts', collection_name: 'posts' } }, format: :json
            expect(response).to be_success
          end
        end
      end

    end
  end
end
