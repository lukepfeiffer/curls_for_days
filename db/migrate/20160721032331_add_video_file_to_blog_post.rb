class AddVideoFileToBlogPost < ActiveRecord::Migration[5.0]
  def change
    add_column :blog_posts, :filepicker_url, :string
  end
end
