require 'rails_helper'

RSpec.describe User, type: :model do
  let(:u1) do
    User.build(
      name: 'richard',
      email: 'h@gmcil.com'
    )
  end

  let(:u2) do
    User.build(
      name: 'bill',
      email: '2@gmail.com'
    )
  end

  let(:u3) do
    User.build(
      name: 'tom',
      email: 't@gmail.com'
    )
  end

  before do
    u1.referrer = u3
    u2.referrer = u3
  end

  describe 'associations' do
    it 'should link to correct referrer' do
      expect(u1.referrer).to be u3
    end

    it 'should link to correct referrals' do
      expect(u3.referrals).to contain_exactly u1, u2
    end
  end

  describe 'validations' do
    describe 'referral_codes are unique' do
      before do
        u1.referral_code = 'abc'
        u2.referral_code = '456'
      end

      it 'should not throw error if referral_code are different' do
        expect(u1.save).to be true
        expect(u2.save).to be true
      end
    end

    describe 'referral_codes are not unique' do
      before do
        u1.referral_code = 'abc'
        u2.referral_code = 'abc'
      end

      it 'should not throw error if referral_code are different' do
        expect(u1.save).to be true
        expect(u2.save).to be false
      end
    end
  end
end
