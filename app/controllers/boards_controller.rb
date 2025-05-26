class BoardsController < ApplicationController
  def index
    @boards = Board.all
    @board = Board.new
  end

  def show
    @board = Board.find(params[:id])
    @post = Post.new
  end

  def create
    @board = Board.new(board_params)

    if @board.save
      redirect_to boards_path, notice: "Board created successfully."
    else
      redirect_to boards_path, alert: @board.errors.full_messages.to_sentence
    end
  end

  private

  def board_params
    params.require(:board).permit(:name)
  end
end

