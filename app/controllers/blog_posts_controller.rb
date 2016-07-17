class BlogPostsController < ApplicationController
  before_action :authenticate_blogger, only: [:create, :new, :edit, :update]

  expose :blog_post
  expose :blog_posts do
    BlogPost.all
  end

  def create
    blog_post.user_id = current_user.id
    if blog_post.save
      redirect_to blog_post_path(blog_post)
    else
      redirect_to :new
    end
  end

  def blog_post_params
    params.require(:blog_post).permit(
      :content,
      :description,
      :hair_type,
      :title,
      :subtitle,
      :video_url
    )
  end

  def authenticate_blogger
    unauthorized_redirect_route
    if current_user.blank?
      redirect_to @referrer_url.to_s
    elsif !current_user.blogger?
      redirect_to @referrer_url.to_s
    elsif params[:id] != current_user.id && params[:action] == (('edit') || ('update'))
      redirect_to @referrer_url.to_s
    end
  end

  def unauthorized_redirect_route
      @referrer_url = URI.parse(request.referrer) rescue URI.parse('/')

      @referrer_url.query = Rack::Utils.parse_nested_query(@referrer_url.query).merge({notice: 'unauthorized'}).to_query
  end

end
