module Kms
  class HasManyField < Field
    def get_value(entry)
      entry_ids = entry.values[liquor_name]
      association_records = Kms::Entry.where(id: entry_ids)
      if entry_ids.present?
        # this one allows ORDER BY the IN value list like this example:
        # SELECT * FROM "comments" WHERE ("comments"."id" IN (1,3,2,4))
        # ORDER BY  id=1 DESC, id=3 DESC, id=2 DESC, id=4 DESC
        order_sql = entry_ids.map {|entry_id| "id=#{entry_id} DESC"}
        association_records = association_records.order(order_sql.join(','))
      end
      Liquor::DropDelegation.wrap_scope(association_records)
    end
  end
end
