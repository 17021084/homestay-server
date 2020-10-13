class Api::V1::AccountActivationsController < ApplicationController
  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      redirect_to "https://youtube.com", allow_other_host: false
    else
      redirect_to "https://google.com.vn", allow_other_host: false
    end
  end
end
