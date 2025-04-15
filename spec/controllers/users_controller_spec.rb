require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'create' do
    let!(:u2) do
      User.create(name: 'b', email: 'b@gmail.com', referral_code: 'abc123')
    end

    describe 'referral code exists' do
      let(:action) do
        post :create, params: { user: { name: 'test', email: 'test@g.com', referral_code: u2.referral_code } }
      end

      it 'should create a new user' do
        expect {
          action
        }.to change { User.count }.by(1)
      end

      it 'should create correct referral' do
        action
        user = User.find_by(email: 'test@g.com')

        expect(user.referrer).to eq u2
      end
    end

    describe 'referral code not provided' do
      let(:action) do
        post :create, params: { user: { name: 'test', email: 'test@g.com' } }
      end

      it 'should create a new user' do
        expect {
          action
        }.to change { User.count }.by(1)
      end

      it 'should not create' do
        action
        user = User.find_by(email: 'test@g.com')

        expect(user.referrer).to be_nil
      end
    end
  end
end
