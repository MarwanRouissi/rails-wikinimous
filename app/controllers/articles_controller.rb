class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  def index
    @articles = Article.all
  end

  def show; end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to task_path(@article)
  end

  def edit; end

  def update
    @article.update(article_params)
    redirect_to task_path(@article)
  end

  def destroy
    @article.destroy
    redirect_to task_path, status: :see_other
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
