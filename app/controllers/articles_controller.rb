class ArticlesController < ApplicationController
  include ArticlesHelper

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    @comment.article_id = @article_id
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(article_params)
    if @article.save
      flash.notice = "Article '#{@article.title}' Saved!"
      redirect_to @article
    else
      render :new
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash.notice = "Article '#{@article.title}' Deleted!"
    redirect_to articles_path
  end

  def edit
    @article = Article.find(params[:id])
    render :edit
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash.notice = "Article '#{@article.title}' Updated!"
      redirect_to @article
    else
      render :edit
    end
  end
end
