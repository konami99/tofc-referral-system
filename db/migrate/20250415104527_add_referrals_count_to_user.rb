class AddReferralsCountToUser < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :referrals_count, :integer, default: 0, null: false
  end
end
