class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:show, :edit, :update, :destroy]

  # GET /bookmarks
  # GET /bookmarks.json
  def index
    @bookmarks = Bookmark.all
  end

  # GET /bookmarks/1
  # GET /bookmarks/1.json
  def show
  end

  # GET /bookmarks/new
  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
  end

  # GET /bookmarks/1/edit
  def edit
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
  end

  # POST /bookmarks
  # POST /bookmarks.json
  def create
    authorize @bookmark
    @topic = Topic.find(params[:topic_id])
    bookmark = @topic.bookmarks.new(bookmark_params)
    bookmark.user = current_user

    if bookmark.save
      flash[:notice] = "Bookmark saved successfully."
      redirect_to topics_path
    else
      flash[:alert] = "Bookmark failed to save."
      redirect_to topics_path
    end
  end

  # PATCH/PUT /bookmarks/1
  # PATCH/PUT /bookmarks/1.json
  def update
    authorize @bookmark
    if @bookmark.update(bookmark_params)
      flash[:notice] = "Bookmark updated successfully."
      redirect_to topics_path
    else
      flash[:alert] = "Bookmark failed to update."
      redirect_to topics_path
    end
  end

  # DELETE /bookmarks/1
  # DELETE /bookmarks/1.json
  def destroy
    authorize @bookmark
    @bookmark.destroy
    flash[:notice] = "Bookmark deleted."
    redirect_to topics_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bookmark
      @bookmark = Bookmark.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bookmark_params
      params.require(:bookmark).permit(:url)
    end
end
