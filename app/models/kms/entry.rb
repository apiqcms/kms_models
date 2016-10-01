module Kms
  class Entry < ActiveRecord::Base
    include Liquor::Dropable
    extend ::FriendlyId
    include CompileTemplates

    friendly_id :slug_candidates, use: :slugged
    belongs_to :model
    after_save :store_files, if: :cache_names_present?

    validates :slug, uniqueness: { scope: :model_id }

    attr_reader :cache_names

    def slug_candidates
      [values[model.label_field]]
    end

    def permalink
      templatable_page = Kms::Page.where(templatable_type: model.name).first
      return nil unless templatable_page
      Pathname.new(templatable_page.parent.fullpath).join(slug.to_s).to_s
    end

    def values
      read_attribute(:values) || {}
    end

    def values=(new_values)
      files_params = new_values.select { |_, v| v.is_a?(ActionDispatch::Http::UploadedFile) || v.is_a?(File) }
      @cache_names ||= {}
      files_params.each do |k, v|
        uploader = EntryFileUploader.new(OpenStruct.new(model: self, field_name: k))
        uploader.cache!(v)
        @cache_names[k] = uploader.cache_name
        files_params[k] = v.original_filename
      end
      super values.merge new_values.merge(files_params)
    end

    def method_missing(name, *args, &block)
      model.fields.where(liquor_name: name.to_s).exists? ? values[name.to_s] : super
    end

    def respond_to_missing?(method_name, include_private = false)
      model.fields.where(liquor_name: method_name.to_s).exists? || super
    end

    protected

    def cache_names_present?
      cache_names.present?
    end

    def store_files
      values.each do |k, v|
        next unless cache_names.keys.include? k
        uploader = EntryFileUploader.new(OpenStruct.new(model: self, field_name: k))
        uploader.retrieve_from_cache!(cache_names[k])
        uploader.store!
      end
    end
  end
end
