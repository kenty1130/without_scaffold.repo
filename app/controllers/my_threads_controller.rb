class MyThreadsController < ApplicationController
  def index
    @my_threads = MyThread.all.order(created_at: 'desc')
  end

  def show
    @my_thread = MyThread.find(params[:id])
    @comments = @my_thread.comments.order(created_at: 'desc')
    @comment = @my_thread.comments.build
  end

  def new
    @my_thread = MyThread.new
    # @user_id = @my_thread.user_id
  end

  def create
    @my_thread = MyThread.new(my_thread_params)
    @my_thread.user_id = current_user.id if current_user
    if @my_thread.save
      redirect_to my_threads_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    @my_thread = MyThread.find(params[:id])
  end

  def update
    @my_thread = MyThread.find(params[:id])
    @my_thread.user_id = current_user.id if current_user
    if @my_thread.update(my_thread_params)
      redirect_to my_threads_path
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @my_thread = MyThread.find(params[:id])
    @my_thread.destroy
    redirect_to my_threads_path
  end

  private
    def my_thread_params
      params.require(:my_thread).permit(:title)
    end

end
