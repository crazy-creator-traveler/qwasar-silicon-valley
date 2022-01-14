class CommentsController < ApplicationController
  # http_basic_authenticate_with method blocks access to the various actions|features if the person is not authenticated.
  # In our case, while the user is not authenticated, user will not be able to access features such as: creating a comment, deleting a comment.
  # NOTE: 
  #   Right now, in our code, we are passing static arguments to the method
  #   so it means that only a user with the > name: Sultan && password: Kyzyltau777
  #   will be able to access all features.
  #
  #   Two popular authentication add-ons for Rails are the:
  #     - Devise gem (rails engine) > https://github.com/heartcombo/devise
  #     - Authlogic gem > https://github.com/binarylogic/authlogic
  http_basic_authenticate_with name: "Sultan", password: "Kyzyltau777"
  
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

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy

    redirect_to article_path(@article)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :status)
    end
end
