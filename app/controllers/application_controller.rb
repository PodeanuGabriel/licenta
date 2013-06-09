class ApplicationController < ActionController::Base

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

end
