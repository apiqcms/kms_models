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
          expect(json[0].keys).to include('id', 'collection_name', 'kms_model_name', 'label_field', 'allow_creation_using_form', 'fields_attributes')
        end
      end
      describe '#show' do
        it 'returns model json representation' do
          model = FactoryGirl.create(:model)
          get :show, params: { id: model.id }, format: :json
          expect(response).to be_success
          expect(json.keys).to include('id', 'collection_name', 'kms_model_name', 'label_field', 'allow_creation_using_form', 'fields_attributes')
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
          it "returns no content" do
            attributes = { kms_model_name: 'Posts', collection_name: 'posts', description: 'Posts', allow_creation_using_form: true }
            post :create, params: { model: attributes }, format: :json
            expect(response).to have_http_status(204)
            expect(Kms::Model.last.attributes.symbolize_keys).to include attributes
          end
        end
      end
      describe '#update' do
        context 'when validation failed' do
          it "returns errors" do
            model = FactoryGirl.create(:model)
            put :update, params: { id: model.id, model: { kms_model_name: '' } }, format: :json
            expect(response.unprocessable?).to be true
            expect(json['errors']).to_not be nil
          end
        end
        context 'when valid' do
          it "returns no content" do
            model = FactoryGirl.create(:model)
            new_attributes = { kms_model_name: 'Comments', collection_name: 'comments', allow_creation_using_form: true }
            put :update, params: { id: model.id, model: new_attributes }, format: :json
            expect(response).to have_http_status(204)
            expect(Kms::Model.last.attributes.symbolize_keys).to include new_attributes
          end
        end
      end
      describe '#destroy' do
        it 'destroys model and returns no content' do
          model = FactoryGirl.create(:model)
          expect{delete :destroy, params: { id: model.id }, format: :json}.to change{Kms::Model.count}.by(-1)
          expect(response).to have_http_status(204)
        end
      end

    end
  end
end
