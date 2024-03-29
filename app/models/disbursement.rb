class Disbursement < ApplicationRecord
  belongs_to :item, polymorphic: true
end
