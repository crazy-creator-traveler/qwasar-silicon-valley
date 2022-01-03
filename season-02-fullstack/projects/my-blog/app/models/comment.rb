class Comment < ApplicationRecord
  belongs_to :article # sets up an Active Record association.
end
