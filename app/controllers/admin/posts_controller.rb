class Admin::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to admin_posts_path, notice: "Post criado com sucesso!"
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to admin_posts_path, notice: "Post atualizado!"
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_posts_path, notice: "Post removido!"
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def authorize_admin!
    redirect_to root_path, alert: "Acesso negado!" unless current_user.admin?
  end
end
