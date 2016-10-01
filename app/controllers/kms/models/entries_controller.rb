module Kms
  module Models
    class EntriesController < ApplicationController
      def index
        model = Model.find(params[:model_id])
        @entries = model.entries.order('position')
        render json: @entries, root: false
      end

      def show
        model = Model.find(params[:model_id])
        @entry = model.entries.find(params[:id])
        render json: @entry, root: false
      end

      def create
        model = Model.find(params[:model_id])
        @entry = model.entries.new(entry_params)
        if @entry.save
          render json: @entry, root: false
        else
          render json: @entry.to_json(methods: :errors), status: :unprocessable_entity
        end
      end

      def update
        model = Model.find(params[:model_id])
        @entry = model.entries.find(params[:id])
        if @entry.update_attributes(entry_params)
          render json: @entry, root: false
        else
          render json: @entry.to_json(methods: :errors), status: :unprocessable_entity
        end
      end

      def destroy
        @entry = Entry.find(params[:id])
        @entry.destroy
        render json: @entry, root: false
      end

      protected

      def entry_params
        params.require(:entry).permit!
      end
    end
  end
end
