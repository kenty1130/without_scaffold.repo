class MyThreads::CommentsController < ApplicationController
  def create
    @my_thread = MyThread.find(params[:my_thread_id])
    @comment = @my_thread.comments.new(comment_params)
    @comment.user_id = current_user.id if current_user
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

  def update
    @my_thread = MyThread.find(params[:id])
    @comment = @my_thread.comments.find(params[:id])
    @comment.user_id = current_user.id if current_user
    if @comment.update(comment_params)
      redirect_to my_thread_path(@my_thread)
    else
      render 'comments/edit', status: :unprocessable_entity
    end
  end
  def destroy
    @my_thread = MyThread.find(params[:my_thread_id])
    @comment = @my_thread.comments.find(params[:id])
    @comment.destroy
    redirect_to my_thread_path(@my_thread)
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
