class CommentsController < ApplicationController
  include CommentsHelper

  before_filter :require_login, only: [:create]

  def create
    @comment = Comment.new(comment_params)
    @comment.article_id = params[:article_id]
    if @comment.save
      flash.notice = "Comment Saved!"
      redirect_to article_path(@comment.article)
    else
      render :show
    end
  end
end
