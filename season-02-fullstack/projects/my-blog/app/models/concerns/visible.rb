=begin
  Concerns are
      ==> A way to make large Controllers or Models easier to understand and manage.
        ==> This also has the advantage of reusability when multiple Models (or Controllers) share the same concerns.
      
      ==> Implemented using modules that contain methods representing a well-defined slice of the functionality that a Model or Controller is responsible for.
        ==> In other languages, Modules are often known as > Mixins.

  We can use Concerns in our Controller or Model the same way we would use any Module. 
  When we first created our app with rails new my-blog, two folders were created within app/ along with the rest:
        - app/controllers/concerns
        - app/models/concerns
            ==> We can create a new file inside > File Name == Concern|Module Name
=end

module Visible
  # using 'extend' keyword to include 'Concern' module 
  extend ActiveSupport::Concern

  VALID_STATUSES = ['public', 'private', 'archived']

  # included method from 'ActiveSupport::Concern' module.
  included do
    validates :status, inclusion: { in: VALID_STATUSES }
  end

  # class_methods method to declare class methods in module 'Visible'
  # class_methods method from 'ActiveSupport::Concern' module.
  class_methods do
    def public_count
      where(status: 'public').count
    end
  end

  # archived? method to avoid displaying any article that is archived.
  def archived?
    status == 'archived'
  end
end
