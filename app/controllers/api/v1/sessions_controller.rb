class Api::V1::SessionsController < ApplicationController
    # def create
    #     user=User.new(user_params)
    #     if user.save
    #         token=user.jti
    #         render json:token
    #     else
    #         render json:{errors: user.errors.full_messages}

    # end

  def create
    already = User
           .find_by_email(params[:email])

    user=User.new(user_params)

    if already.blank?


    if user.save
      session[:user_id] = user.id
      render json: {
        status: :created,
        logged_in: true,
        user: user
      }
    else
      render json: { status: 401 }
    end

else
render json:{error: "email already in use"}

end
  end

  private

  def user_params
    params.require(:user).permit(:email,:password)
  end


end
