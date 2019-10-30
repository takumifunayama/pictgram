class PostsController < ApplicationController
  def index
    @post = Post.new
    @topic_id = params[:topic_id]
  end

  def show
    @post = Post.find(params[:id])
  end
  
  def create
    @post = Post.new
    @post.topic_id = params[:topic_id]
    @post.content = params[:content]
    
    if  @post.save
      redirect_to topics_path,success: 'コメントに成功しました'
    else
      flash.now[:danger] = "コメントに失敗しました"
      render :new
    end
  end
end
