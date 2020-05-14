class Category < ActiveRecord::Base
  has_and_belongs_to_many :discussions

  default_scope lambda { order('categories.name') }
end
