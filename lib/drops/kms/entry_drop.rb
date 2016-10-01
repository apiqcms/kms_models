module Kms
  class EntryDrop < Liquor::Drop

    attributes :id, :created_at, :permalink, :model_collection_name
    scopes :order

    # overriding methods cause we work with 'json' column
    class Scope
      def find_by(_, fields={})
        fields, = Liquor::Drop.unwrap_scope_arguments([ fields ])

        json_queries = fields.map {|name, value| "values ->> '#{name}' = ?" }
        result = @source.where(json_queries.join(" AND "), *fields.values.map(&:to_s)).first
        Liquor::DropDelegation.wrap_element result if result
      end

      def find_all_by(_, fields={})
        fields, = Liquor::Drop.unwrap_scope_arguments([ fields ])

        json_queries = fields.map {|name, value| "values ->> '#{name}' = ?" }
        result = @source.where(json_queries.join(" AND "), *fields.values.map(&:to_s))
        Liquor::DropDelegation.wrap_scope(result)
      end

      def order(*args)
        args = Liquor::Drop.unwrap_scope_arguments(args)
        parsed_args = args.map do |arg|
          order_clause = arg.split(' ')
          if order_clause[0].in? ["id", "created_at", "updated_at", "position"]
            order_clause.join(' ')
          else
            ["values ->> '#{order_clause[0]}'", order_clause[1].to_s].join(' ')
          end
        end
        # we use reorder because by default we order by position
        Liquor::DropDelegation.wrap_scope @source.reorder(*parsed_args)
      end
    end

    def initialize(source)
      self.class.instance_eval do
        source.model.fields.pluck(:liquor_name).each do |field_name|
          export field_name.to_sym
        end
      end
      super(source)
    end

    def method_missing(name, *args, &block)
      field = source.model.fields.find_by(liquor_name: name.to_s)
      field ? field.get_value(source) : super
    end

    def respond_to_missing?(method_name, include_private = false)
      source.model.fields.where(liquor_name: method_name.to_s).exists? || super
    end

    def created_at
      source.created_at.to_s
    end

    def model_collection_name
      source.model.collection_name
    end

  end
end
