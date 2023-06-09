class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :update, :edit, :destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def show
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      flash[:notice] = "Article was successfully created"
      redirect_to @article
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article was updated"
      redirect_to @article
    else
      flash[:notice] = "Article was not updated"
      render "edit"
    end
  end

  def destroy
    @article.destroy

    redirect_to @article
  end

  private
  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end
end
