class CommentsController < ApplicationController
  # We'll see a bit more complexity here than we did in the controller for articles.
  # That's a side-effect of the nesting that we've set up.
  def create
    @article = Article.find(params[:article_id])

    # We use the create method on @article.comments to create and save the comment.
    # This will automatically link the comment so that it belongs to that particular article
    @comment = @article.comments.create(comment_params)
  
    # article_path(@article) helper > As we have already seen,
    # calls the show action of the ArticlesController which in turn renders the show.html.erb template.
    redirect_to article_path(@article)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :status)
    end
end
