class BloggersController < UsersController
  before_action :authenticate_blogger, only: [:edit]

  expose :bloggers do
    User.where(blogger: true)
  end
  expose :blogger do
    User.find(params[:id])
  end
  expose :blogger_posts do
    BlogPost.where(user_id: params[:id])
  end

  def authenticate_blogger
    unauthourized_redirect_route
    if current_user.blank?
      redirect_to referrer_url.to_s
    elsif !current_user.blogger?
      redirect_to referrer_url.to_s
    end
  end

  def unauthorized_redirect_route
    back_path = redirect_to(:back)
    referrer_url = URI.parse(request.referrer) rescue URI.parse(back_path)
    referrer_url.query = Rack::Utils.parse_nested_query(referrer_url.query).merge({notice: 'unauthorized'}).to_query
  end
end
