class BlogPost < ActiveRecord::Migration[5.0]
  def change
    create_table :blog_posts do |t|
      t.string :title
      t.string :subtitle
      t.string :hair_type
      t.string :description
      t.string :video_url
      t.text :content
    end
  end
end
