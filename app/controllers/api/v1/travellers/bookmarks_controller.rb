class Api::V1::Travellers::BookmarksController < ApiController
  before_action :authenticate_token!, only: [:create, :destroy, :index]
  before_action :load_bookmark, only: [:destroy, :create]
  before_action :is_owned?, only: [:create]

  def index
    @bookmark_places = Place.get_all_bookmarks(@current_user.id).order_bookmarks
    @user_name = @current_user.full_name
    render :index, status: :ok
  end

  def create
    if !@bookmark.nil?
      render json: {
        success: false,
        message: "You have already bookmarked"
      }, status: :bad_request
    elsif @unmarkable
      render json: {
        success: false,
        message: "You can't bookmark your place"
      }, status: :bad_request
    else
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
  end

  def destroy
    if @bookmark.nil?
      return render json: {
        success: false,
        message: "Couldn't deleted bookmark"
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

  def get_host_place place_id
    place = Place.find_by id: place_id
    place.host.try(:id)
  end

  def is_owned?
    @unmarkable = false
    cur_host = get_host_place params[:place_id]
    @unmarkable = true if @current_user.id == cur_host
  end
end
