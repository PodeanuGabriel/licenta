class ApplicationController < ActionController::Base

  before_filter :cors_preflight_check
  after_filter :cors_set_access_control_headers

  helper :all

  protect_from_forgery

  helper_method :current_user , :current_owner

  private

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record.email
  end
  
  def current_owner
    return @owner_id if defined?(@owner_id)
    @owner_id = User.find(:all,
                          :select => " id" ,
                          :conditions => " email = '#{ current_user }'" ).map{|x| x.id}.first
  end

  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Max-Age'] = "1728000"
    headers['Access-Control-Allow-Headers'] = 'content-type, accept'

  end

  def cors_preflight_check
    if request.method == :get_coupons
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
      headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version, X-CSRF-Token'
      headers['Access-Control-Max-Age'] = '1728000'
      render :text => '', :content_type => 'text/plain'
    end
  end

end
