class AddExcerptAndLocatiionToDiscussions < ActiveRecord::Migration[5.1]
  def change
    add_column :discussions, :excerpt, :string
    add_column :discussions, :location, :string
  end
end
