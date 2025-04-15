require 'rails_helper'

RSpec.describe SignupController, type: :controller do
  describe 'create' do
    let(:u2) do
      User.create(name: 'b', email: 'b@gmail.com', referral_code: 'abc123')
    end

    it '' do
      post :create, params: { user: { name: 'test', email: 'test@g.com', referral_code: u2.referral_code } }
    
      
    end
  end
end
