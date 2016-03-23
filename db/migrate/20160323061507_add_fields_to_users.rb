class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :description, :text
    add_column :users, :advisory, :boolean, default: false
    add_column :users, :work_title, :string
    add_column :users, :image, :string
  end
end
