class LikesController < ApplicationController
  def create
    bookmark = Bookmark.find(params[:bookmark_id])
    like = Like.new(
      :user_id => current_user.id,
      :bookmark_id => bookmark.id
    )

    if like.save!
      flash[:notice] = "Liked."
    else
      flash[:alert] = "Error."
    end

    redirect_to topics_path
  end

  def destroy
    like = current_user.likes.find(params[:id])
    if like.destroy!
      flash[:notice] = "UnLiked."
    else
      flash[:alert] = "Error."
    end

    redirect_to topics_path
  end

end
