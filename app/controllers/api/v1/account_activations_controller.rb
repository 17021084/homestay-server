class Api::V1::AccountActivationsController < ApplicationController
  def edit
    user = User.find_by(email: params[:email])
    user.activate if user && !user.activated? && user.authenticated?(:activation, params[:id])
    redirect_to_client
  end

  private

  def redirect_to_client
    redirect_to ENV["CLIENT_URL"], allow_other_host: false
  end
end
