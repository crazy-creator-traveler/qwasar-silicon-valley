=begin
NOTE:
  Active Record automatically defines model attributes for every table column
    > So we don't have to declare those attributes in our model file.
=end

class Article < ApplicationRecord
  include Visible
  
# Sets up an Active Record Association
# Active Record Associations let us easily declare the relationship between two models:
#   -comment
# and
#   -article
# in this case we specify that > One article can have many comments.
# NOTE:
#   if we have an instance variable @article containing an article
#   we can retrieve all the comments belonging to that article as an array using @article.comments.
#   For more info, about the Active Record Associations > https://guides.rubyonrails.org/v6.1/association_basics.html 
  has_many :comments

# Validations are rules that are checked before a model object is saved. 
# If any of the checks fail:
#   1)The save will be aborted
#   2)Appropriate error messages will be added to the errors attribute of the model object.
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
