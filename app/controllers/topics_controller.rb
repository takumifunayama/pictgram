class TopicsController < ApplicationController
  def index
    @topics = Topic.all.includes(:favorite_users)
    @posts = Post.where(topic_id: params[:topic_id])
  end
  
  def new
    @topic = Topic.new
  end
  
  def create
    @topic = current_user.topics.new(topic_params)
    
    if  @topic.save
      redirect_to topics_path,success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end
  
  def destroy
    @favorite = Favorite.find_by(user_id: @current_user.id, topic_id: params[:topic_id])
    @favorite.destroy if favorite.present?
    redirect_to topics_path, success: 'お気に入りを取り消しました'
    #redirect_to("/topics/#{params[:topic_id]}")
  end
  
  private
  def topic_params
    params.require(:topic).permit(:image,:description)
  end
end
