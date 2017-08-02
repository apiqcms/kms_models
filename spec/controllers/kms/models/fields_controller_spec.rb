require 'spec_helper'

module Kms
  module Models
    describe FieldsController, type: :controller do
      routes { Kms::Models::Engine.routes }

      login_user
      describe '#update' do
        it "responds with 204 status" do
          model = FactoryGirl.create(:model_with_string_field)
          put :update, params: { model_id: model.id, id: model.fields.first.id, field: { position: 1 } }, format: :json
          expect(response).to be_success
        end
        it "updates field's values" do
          model = FactoryGirl.create(:model_with_string_field)
          first_field = model.fields.first # position 0 here
          put :update, params: { model_id: model.id, id: first_field.id, field: { position: 1 } }, format: :json
          expect(first_field.reload.position).to be_eql(1)
        end
      end
    end
  end
end
