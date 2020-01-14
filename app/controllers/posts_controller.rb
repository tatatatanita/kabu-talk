class PostsController < ApplicationController
  before_action :set_group

  def index
    @post = Post.new
    @posts = @forum.posts.includes(:user)
    @members = @forum.users
  end

  def create
    @post = @forum.posts.new(post_params)
    if @post.save
      redirect_to forum_posts_path(@forum), notice: 'メッセージが送信されました'
      # redirect_to group_messages_path(@group)
    else
      @posts = @forum.posts.includes(:user)
      # @messages = @group.messages.includes(:user)
      flash.now[:alert] = 'メッセージを入力してください。'
      render :index
    end
  end

  private

  def post_params
    params.require(:post).permit(:text, :image).merge(user_id: current_user.id)
  end

  def set_group
    @forum = Forum.find(params[:forum_id])
  end
end