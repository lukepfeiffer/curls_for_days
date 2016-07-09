class BlogPostsController < ApplicationController
  before_action :authenticate_blogger, only: [:create, :new, :edit, :update]

  expose :blog_post
  expose :blog_posts do
    BlogPost.all
  end
  I
  def authenticate_user
    unauthourized_redirect_route
    if current_user.blank?
      redirect_to referrer_url.to_s
    elsif !current_user.blogger?
      redirect_to referrer_url.to_s
    elsif params[:id].present? && params[:id] != current_user.id
      redirect_to referrer_url.to_s
    end
  end

  def unauthorized_redirect_route
      referrer_url = URI.parse(request.referrer) rescue URI.parse('/')

      referrer_url.query = Rack::Utils.parse_nested_query(referrer_url.query).merge({notice: 'unauthorized'}).to_query
  end

end
