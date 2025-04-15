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

  describe 'status' do
    describe 'referrals < 3' do
      before do
        u1.save
        u2.save
        u3.save
      end

      it 'should show status bronze' do
        expect(u3.referrals_count).to be 2
        expect(u3.status).to eq 'bronze'
      end
    end

    describe 'referrals < 5' do
      let(:u4) do
        User.build(
          name: 'u4',
          email: 'u4@gmail.com'
        )
      end

      let(:u5) do
        User.build(
          name: 'u5',
          email: 'u5@gmail.com'
        )
      end

      before do
        u4.referrer = u3
        u5.referrer = u3

        u1.save
        u2.save
        u3.save
        u4.save
        u5.save
      end

      it 'should show status silver' do
        expect(u3.referrals_count).to be 4
        expect(u3.status).to eq 'silver'
      end
    end

    describe 'referrals >= 5' do
      let(:u4) do
        User.build(
          name: 'u4',
          email: 'u4@gmail.com'
        )
      end

      let(:u5) do
        User.build(
          name: 'u5',
          email: 'u5@gmail.com'
        )
      end

      let(:u6) do
        User.build(
          name: 'u6',
          email: 'u6@gmail.com'
        )
      end

      before do
        u4.referrer = u3
        u5.referrer = u3
        u6.referrer = u3

        u1.save
        u2.save
        u3.save
        u4.save
        u5.save
        u6.save
      end

      it 'should show status gold' do
        expect(u3.referrals_count).to be 5
        expect(u3.status).to eq 'gold'
      end
    end
  end

  describe 'conter cache' do
    before do
      u1.save
      u2.save
      u3.save
    end

    it 'should return referrals_count' do
      expect(u3.referrals_count).to be 2
    end
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

    describe 'referral_codes are nil' do
      before do
        u1.referral_code = nil
        u2.referral_code = nil
      end

      it 'should not throw error if referral_code are different' do
        expect(u1.save).to be true
        expect(u2.save).to be true
      end
    end

    describe 'referral_codes are empty' do
      before do
        u1.referral_code = ''
        u2.referral_code = ''
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
