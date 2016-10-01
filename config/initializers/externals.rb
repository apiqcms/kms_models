Kms::ExternalsRegistry.register(:models) {|_,_| Kms::ModelsWrapper.new.to_drop }
