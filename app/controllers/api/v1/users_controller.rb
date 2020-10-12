class Api::V1::UsersController < ApplicationController
  def create
    @user = User.create user_params

    if @user.save
      @token = JsonWebToken.encode id: @user.id, is_host: false
      render :create, status: :ok
    else
      validation_errors = @user.errors.full_messages
      render json: {success: false, message: "Unable to create this Account", errors: validation_errors},
              status: :bad_request
    end
  end

  private

  def user_params
    params.permit User::USER_CREATE_PARAMS
  end
end
