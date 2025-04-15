class SignupController < ApplicationController
  def create
    new_user = User.build(
      name: params[:user][:name],
      email: params[:user][:email]
    )

    refferal_code = params[:user][:referral_code]

    if refferal_code
      referrer = User.find_by(referral_code: refferal_code)

      if referrer
        new_user.referrer = referrer
      else
        # render edit with error message
        render :edit, errors: [ "Invalid referral code" ]
      end
    end
  end

  def new
  end

  private

  def allow_params
    # allow params to be passed user_params
    params.require(:user).permit(:name, :email, :referral_code)
  end
end
