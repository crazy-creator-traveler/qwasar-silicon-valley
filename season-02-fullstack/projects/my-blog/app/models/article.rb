=begin
NOTE:
  Active Record automatically defines model attributes for every table column
    > So we don't have to declare those attributes in our model file.
=end

class Article < ApplicationRecord
  has_many :comments

# Validations are rules that are checked before a model object is saved. 
# If any of the checks fail:
#   1)The save will be aborted
#   2)Appropriate error messages will be added to the errors attribute of the model object.
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
