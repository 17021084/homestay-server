class Api::V1::UsersController < ApiController
  before_action :authenticate_token!, only: :update

  def create
    @user = User.create user_create_params

    if @user.save
      @user.register
      render :create, status: :ok
    else
      validation_errors = @user.errors.full_messages
      render json: {success: false, message: "Unable to create this Account", errors: validation_errors},
              status: :bad_request
    end
  end

  def update
    @user = User.find_by id: params[:id]
    if @user && @user.id == @current_user.id

      return render :update if @user.update user_update_params

      return render json: {
        success: false,
        error: @user.errors
      }, status: :bad_request
    end

    render json: {sucess: false, message: "Update invalid user"}, status: :bad_request
  end

  private

  def user_create_params
    params.permit User::USER_CREATE_PARAMS
  end

  def user_update_params
    params.permit User::USER_UPDATE_PARAMS
  end
end
