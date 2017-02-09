module Kms
  class Model < ActiveRecord::Base
    has_many :fields, class_name: 'Kms::Field', dependent: :destroy
    has_many :entries, class_name: 'Kms::Entry', dependent: :destroy
    accepts_nested_attributes_for :fields, allow_destroy: true

    validates :kms_model_name, :collection_name, presence: true

    def name
      id.to_s
    end

    # Hacking hack
    def model_name
      value = kms_model_name
      value.instance_eval do
        def human(options={})
          self
        end
      end
      value
    end
  end
end
