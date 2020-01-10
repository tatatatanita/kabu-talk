class ForumsController < ApplicationController

  def index
  end

  def new
    @forum = Forum.new
    @forum.users << current_user
    @members = @forum.users
  end

  def create
    @forum = Forum.new(forum_params)
    if @forum.save
      redirect_to root_path, notice: '企業チャットを作成しました'
    else
      render :new
    end
  end

  def edit
    @forum = Forum.find(params[:id])
  end

  def update
    @forum = Forum.find(params[:id])
    if @forum.update(forum_params)
      redirect_to root_path, notice: '企業チャットを更新しました'
    else
      render :edit
    end
  end

  private
  def forum_params
    params.require(:forum).permit(:name, user_ids: [])
  end

end