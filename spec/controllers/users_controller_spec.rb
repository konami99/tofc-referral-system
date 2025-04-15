require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'create' do
    let!(:u2) do
      User.create(name: 'b', email: 'b@gmail.com', referral_code: 'abc123')
    end

    describe 'referral code exists' do
      it 'should create a new user' do
        expect {
          post :create, params: { user: { name: 'test', email: 'test@g.com', referral_code: u2.referral_code } }
        }.to change { User.count }.by(1)
      end
    end

    describe 'referral code not provided' do
      it 'should create a new user' do
        expect {
          post :create, params: { user: { name: 'test', email: 'test@g.com' } }
        }.to change { User.count }.by(1)
      end
    end
  end
end
