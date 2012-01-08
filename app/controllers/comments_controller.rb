class CommentsController < ApplicationController
  respond_to :html
  before_filter :authenticate_user! 

  
  
  def create
    article = Article.find(params[:article_id])
    @comment = article.comments.build(params[:comment])
    @comment.user = current_user
    
    respond_with(@comment.tap(&:save), :location => article) do |format|
    format.html {redirect_to article}
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
