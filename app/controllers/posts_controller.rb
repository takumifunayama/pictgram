class PostsController < ApplicationController
  def index
    @posts = Post.all
    @post = Post.new
    @topic_id = params[:topic_id]
  end

  def show
    @post = Post.find(params[:id])
  end
  
  def create
    @post = Post.new(post_params)
    if  @post.save
      
      redirect_to posts_path,success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :index
    end
  end
  
  private
  def post_params
    params.require(:post).permit(:content)
  end
end
