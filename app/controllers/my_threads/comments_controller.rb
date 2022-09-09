class MyThreads::CommentsController < ApplicationController
  def create
    @my_thread = MyThread.find(params[:my_thread_id])
    @comment = @my_thread.comments.new(comment_params)
    # binding.pry
    if @comment.save
      redirect_to my_thread_path(@my_thread)
    else
      render my_thread_path(@my_thread), status: :unprocessable_entity
    end
  end

  def edit
    @my_thread = MyThread.find(params[:my_thread_id])
    @comment = @my_thread.comments.find(params[:id])
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
