require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it 'should link to referrer' do
      u1 = User.build(
        name: 'richard',
        email: 'h@gmcil.com'
      )
      u2 = User.build(
        name: 'bill',
        email: '2@gmail.com'
      )

      u1.referrer = u2

      expect(u2.referrals).to include u1
    end
  end


end