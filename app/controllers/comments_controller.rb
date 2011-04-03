class CommentsController < ApplicationController
  respond_to :html
  before_filter :authenticate_user!, :except => [:create, :destroy]

  def create
    article = Article.find(params[:article_id])
    @comment = article.comments.build(params[:comment])
    @comment.user = current_user
    if @comment.save
      redirect_to(@comment.article, :notice => 'Comment was successfully created.')
    else
      redirect_to(@comment.article, :notice => "Comment wasn't successfully created")
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.xml
  def destroy
    article = Article.find(params[:article_id])
    @comment = Comment.find(params[:id])
    authorize! :destroy, @comment
    @comment.destroy
    redirect_to(article)
  end
end
