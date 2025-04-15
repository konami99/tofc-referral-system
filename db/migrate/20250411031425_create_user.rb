class CreateUser < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :referral_code
      t.integer :referred_by_id

      t.timestamps
    end
  end
end
