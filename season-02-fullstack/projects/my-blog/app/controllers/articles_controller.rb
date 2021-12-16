=begin
  NOTE:
    - Each Method in the ArticlesController Сlass is called > Action.

    - By default, the name of the Method|Action and View > Must be identical.
          ==> That is, the Method|Action must > Refer to app/views/articles/action_name.html.erb
                                              > Have a view app/views/articles/action_name.html.erb
Example:
  Method|Action > index
  View          > index.html.erb  
  Route         > "http://localhost:3000/articles"

  Method|Action > show
  View          > show.html.erb
  Route         > "http://localhost:3000/articles/id" 

    - When an action does not explicitly render a view (or otherwise trigger an HTTP response)
          ==> Rails will automatically render a view that matches the name of the controller and action. Convention Over Configuration!
            ==> Views are located in the app/views directory.
Example:
  Controller    > articles_controller.rb
  Method|Action > index

  View          > articles
                > index.html.erb
                                  ==> articles/index.html.erb  
=end
class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create 
    @article = Article.new(article_params)
      if @article.save
        # If the article is saved successfully
        # the action redirects the browser to the article's page at "http://localhost:3000/articles/#{@article.id}"
        redirect_to @article
      else
        # The action redisplays the form by rendering app/views/articles/new.html.erb
        # with a status code 4XX for the app to work fine with Turbo.
        render :new, status: :unprocessable_entity
      end
  end

  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
