class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @not_me = current_user != @user
    @my_posts = Post.where(user: current_user)
    @my_tips = Tip.where(user: current_user)
    @my_articles = Article.where(user: current_user)
    authorize @user
  end

  def no_user
    redirect_to user_path(current_user)
    authorize current_user
  end

  def update_batch
    @user = User.find(params[:id])
    authorize @user
    batch = Batch.find(params[:user][:batch_id])
    city = City.find(params[:user][:city_id])
    @user.update(batch: batch, city: city)
    redirect_to posts_path
  end
end
