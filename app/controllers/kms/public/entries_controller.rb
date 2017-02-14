module Kms
  module Public
    class EntriesController < ActionController::Base
      protect_from_forgery with: :exception
      before_action :find_model

      def create
        entry = @model.entries.new(values: entry_params)
        unless @model.allow_creation_using_form? && entry.save
          render json: {errors: entry.errors}.to_json, status: :unprocessable_entity
        end
      end

      protected

      def find_model
        @model = Model.find_by!(collection_name: params[:collection_name])
      end

      def entry_params
        params.require(:entry).permit(@model.fields.pluck(:liquor_name))
      end
    end
  end
end
