module Kms
  module Models
    class ModelsController < ApplicationController

      def index
        render json: Model.all.to_json
      end

      def show
        @model = Model.find(params[:id])
        render json: @model.to_json(include: {:fields => {methods: :type}})
      end

      def create
        params[:model].merge!(fields_attributes: params[:fields])
        @model = Model.new(model_params)
        if @model.save
          Kms::ResourceService.register(:models, @model, "fa-tasks")
          Kms::ModelsWrapperDrop.register_model @model.collection_name
          render json: @model.to_json
        else
          render json: @model.to_json(methods: :errors), status: :unprocessable_entity
        end
      end

      def update
        params[:model].merge!(fields_attributes: params[:fields])
        @model = Model.find(params[:id])
        if @model.update_attributes(model_params)
          render json: @model.to_json
        else
          render json: @model.to_json(methods: :errors), status: :unprocessable_entity
        end
      end

      def destroy
        @model = Model.find(params[:id])
        @model.destroy
        Kms::ResourceService.unregister(:models, @model)
        render json: @model.to_json
      end

      protected

      def model_params
        params.require(:model).permit!
      end

    end
  end
end
