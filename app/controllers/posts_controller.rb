class PostsController < ApplicationController
  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to board_path(@post.board_id), notice: "Post created successfully."
    else
      redirect_to board_path(@post.board_id), alert: @post.errors.full_messages.to_sentence
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :expires_on, :board_id)
  end
end
