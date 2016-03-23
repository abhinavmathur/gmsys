class AddAuthorToBlogs < ActiveRecord::Migration
  def change
    add_reference :blogs, :author, index: true
    add_foreign_key :blogs, :users, column: :author_id
  end
end
