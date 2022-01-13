class Comment < ApplicationRecord
  include Visible
  
# Sets up an Active Record Association
# Active Record Associations let us easily declare the relationship between two models:
#   -comment
# and
#   -article
# in this case we specify that > Each comment belongs to one article.
# NOTE:
#   For more info, about the Active Record Associations > https://guides.rubyonrails.org/v6.1/association_basics.html  
  belongs_to :article
end
