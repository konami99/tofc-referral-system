class User < ApplicationRecord
  belongs_to :referrer, class_name: "User",
                            foreign_key: :referred_by_id,
                            optional: true,
                            inverse_of: :referrals

  has_many :referrals, class_name: "User", dependent: :destroy, inverse_of: :referrer

  validates_uniqueness_of :referral_code, allow_nil: true, allow_blank: true
end
