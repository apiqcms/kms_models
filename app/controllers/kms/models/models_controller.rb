module Kms
  module Models
    class ModelsController < ApplicationController
      wrap_parameters :model, include: [:kms_model_name, :collection_name, :label_field, :fields_attributes]

      def index
        render json: Model.all, root: false
      end

      def show
        @model = Model.find(params[:id])
        render json: @model, root: false
      end

      def create
        @model = Model.new(model_params)
        if @model.save
          Kms::ResourceService.register(:models, @model, "fa-tasks")
          Kms::ModelsWrapperDrop.register_model @model.collection_name
          render json: @model, root: false
        else
          render json: {errors: @model.errors}.to_json, status: :unprocessable_entity
        end
      end

      def update
        @model = Model.find(params[:id])
        if @model.update_attributes(model_params)
          render json: @model, root: false
        else
          render json: {errors: @model.errors}.to_json, status: :unprocessable_entity
        end
      end

      def destroy
        @model = Model.find(params[:id])
        @model.destroy
        Kms::ResourceService.unregister(:models, @model)
        render json: @model, root: false
      end

      protected

      def model_params
        params.require(:model).permit(:kms_model_name, :collection_name, :label_field, fields_attributes: [:name, :liquor_name, :type, :class_name])
      end

    end
  end
end
