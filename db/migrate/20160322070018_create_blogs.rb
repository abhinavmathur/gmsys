class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :content
      t.boolean :featured, default: false
      t.boolean :publish, default: false

      t.timestamps null: false
    end
  end
end
