class CommentsController < ApplicationController
  # http_basic_authenticate_with name: "ccslakey", password: "secret", only: :destroy
  # before_action :require_user, only: [:index, :show]
  # exceptions for commenting/deleting based on user status/matching
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(comment_params)
    if @article.save
      redirect_to article_path(@article)
    end
  end
 
  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end


  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end