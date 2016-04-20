class CommentsController < ApplicationController
  def new
    @photo = Photo.find(params[:photo_id])
    @comment = Comment.new
  end

  def create
    @photo = Photo.find(params[:photo_id])
    comment = @photo.comments.create(comment_params)
    comment.user_id = current_user.id
    comment.save
    redirect_to photos_path
  end

  def comment_params
    params.require(:comment).permit(:text)
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
  end
end
