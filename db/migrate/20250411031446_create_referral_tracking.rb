class CreateReferralTracking < ActiveRecord::Migration[7.2]
  def change
    create_table :referral_trackings do |t|
      t.integer :referrer_id
      t.integer :referral_id

      t.timestamps
    end
  end
end
