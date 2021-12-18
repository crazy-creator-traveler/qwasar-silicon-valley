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

# Algorithm of actions when a user submits a form:
#   1)Automatically putting the form data along with the captured route parameters into the params hash for storage.(that is, the data is stored in the hash datatype)
#       > An example to access certain data:
#  params[:article][:title] == Article Title
#  params[:article][:body]  == Article Body|Content
#       > We are using an additional key [:article]
#         > Since the form uses the name attribute with these values
#           > Example:
# name="article[title]"
# name="article[body]"
#     > The name of these arrays is automatically generated by RoR.
#
#   2)Redirecting to the -post "/articles" route
#       > This route is handled by Method|Action create().
#       > This route is invisible for the user.
# 
#   3)Running the Method|Action create() to process the -post'/articles' route
#       > If the data was saved successfully, then the user will be redirected to the new route -get "/articles/:id".
#       > If the data hasn't been saved, for some reason, the user will receive a description of the error
#         > And the user will need to submit the form again after fixing certain errors.
#
# NOTE:
#   Logically, we can conclude that requests such as: update, delete, as well as the create request are invisible (run in the background)
#     > So it means that when executing these requests, the route is not explicitly displayed for users.
  def create 
    @article = Article.new(article_params)
    # When we use the save method to save the data in the database
    #   > Our validations set in article.rb are run just before that. 
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

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
      if @article.update(article_params)
        # If the article is updated successfully
        # the action redirects the browser to the article's page at "http://localhost:3000/articles/#{@article.id}"
        redirect_to @article
      else
        # The action redisplays the form by rendering app/views/articles/edit.html.erb
        # with a status code 4XX for the app to work fine with Turbo.
        render :new, status: :unprocessable_entity
      end
  end

  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
