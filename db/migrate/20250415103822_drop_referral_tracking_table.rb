class DropReferralTrackingTable < ActiveRecord::Migration[7.2]
  def change
    drop_table :referral_trackings
  end
end
