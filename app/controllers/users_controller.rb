class UsersController < ApplicationController
  def index
    @users = User.includes([ :referrals ])
  end

  def create
    new_user = User.build(
      name: params[:user][:name],
      email: params[:user][:email]
    )

    referral_code = params[:user][:referral_code]

    if referral_code
      referrer = User.find_by(referral_code: referral_code)

      if referrer
        new_user.referrer = referrer
      else
        return render :new, status: :unprocessable_entity
      end
    end

    new_user.save
  end

  def new
  end

  private

  def allow_params
    # allow params to be passed user_params
    params.require(:user).permit(:name, :email, :referral_code)
  end
end
