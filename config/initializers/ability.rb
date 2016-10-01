if Kms::Model.table_exists?
  Kms::Model.all.each do |model|
    Kms::AbilityService.register do
      can :manage, model
    end
  end
end
