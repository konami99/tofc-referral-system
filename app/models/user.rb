class User < ApplicationRecord
  belongs_to :referrer, class_name: "User",
                            foreign_key: :referred_by_id,
                            optional: true,
                            inverse_of: :referrals

  has_many :referrals, class_name: "User", dependent: :destroy, inverse_of: :referrer

  validates_uniqueness_of :referral_code, allow_nil: true, allow_blank: true

  after_create :award

  private

  def award
    return unless referrer

    referrer.referrals_count += 1

    referrer_referrals_count = referrer.referrals_count


    if referrer_referrals_count > 0 && referrer_referrals_count < 3
      referrer.status = "bronze"
    elsif referrer_referrals_count >= 3 && referrer_referrals_count < 5
      referrer.status = "silver"
    elsif referrer_referrals_count >= 5
      referrer.status = "gold"
    end

    referrer.save
  end
end
