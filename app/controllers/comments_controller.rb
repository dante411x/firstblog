class CommentsController < ApplicationController
  before_action :post_find

  def post_find
    @post = Post.find(params[:post_id])
  end

  def create
    @comment = @post.comments.create(params[:comment].permit(:name, :body))

    redirect_to post_path(@post)
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy

    redirect_to post_path(@post)

  end


end
