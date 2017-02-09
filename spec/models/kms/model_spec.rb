require 'spec_helper'

module Kms
  describe Model, type: :model do
    it { should have_many(:fields) }
    it { should have_many(:entries) }
    it { should have_db_column(:allow_creation_using_form) }
  end
end
