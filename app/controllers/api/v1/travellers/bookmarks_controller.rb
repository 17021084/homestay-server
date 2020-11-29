class Api::V1::Travellers::BookmarksController < ApiController
  before_action :authenticate_token!, only: [:create, :destroy, :index]
  before_action :load_bookmark, only: [:destroy, :create]

  def index
    @bookmark_places = Place.get_all_bookmarks(@current_user.id).order_bookmarks
    @user_name = @current_user.full_name
    render :index, status: :ok
  end

  def create
    unless @bookmark.nil?
      return render json: {
        success: false,
        message: "Could not bookmark"
      }, status: :bad_request
    end

    bookmark = Bookmark.create user_id: @current_user.id, place_id: params[:place_id]
    if bookmark.save
      render json: {
        success: true,
        data: bookmark
      }, status: :ok
    else
      render json: {
        success: false,
        message: bookmark.errors.full_messages
      }, status: :bad_request
    end
  end

  def destroy
    if @bookmark.nil?
      return render json: {
        success: false,
        message: "Couldnt deleted bookmark"
      }, status: :not_found
    end
    @bookmark.destroy
    render json: {
      success: true,
      message: "Deleted bookmark"
    }, status: :ok
  end

  private

  def load_bookmark
    @bookmark = Bookmark.find_by user_id: @current_user.id, place_id: params[:place_id]
  end
end
