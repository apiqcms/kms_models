module Kms
  module Models
    class FieldsController < ApplicationController
      wrap_parameters :field, include: [:position]

      def update
        model = Model.find(params[:model_id])
        @field = model.fields.find(params[:id])
        if @field.update(field_params)
          head :no_content
        else
          render json: @field.to_json(methods: :errors), status: :unprocessable_entity
        end
      end

      protected

      def field_params
        params.require(:field).permit(:position)
      end
    end
  end
end
