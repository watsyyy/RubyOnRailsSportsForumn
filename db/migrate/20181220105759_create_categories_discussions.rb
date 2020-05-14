class CreateCategoriesDiscussions < ActiveRecord::Migration
  def change
    create_table :categories_discussions, :id => false do |t|
	t.references :discussion
	t.references :category
    end
  end
  
  def self.down
  drop_table :categories_discussions
end
end