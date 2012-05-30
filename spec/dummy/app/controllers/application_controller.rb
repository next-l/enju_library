class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied, :with => :render_403

  enju_library

  private
  def render_403
    return if performed?
    if user_signed_in?
      respond_to do |format|
        format.html {render :template => 'page/403', :status => 403}
        format.xml {render :template => 'page/403', :status => 403}
        format.json
      end
    else
      respond_to do |format|
        format.html {redirect_to new_user_session_url}
        format.xml {render :template => 'page/403', :status => 403}
        format.json
      end
    end
  end

  def current_ability
    @current_ability ||= Ability.new(current_user, request.remote_ip)
  end

  def solr_commit
    Sunspot.commit
  end

  def move_position(resource, direction, redirect = true)
    if ['higher', 'lower'].include?(direction)
      resource.send("move_#{direction}")
      if redirect
        redirect_to url_for(:controller => resource.class.to_s.pluralize.underscore)
        return
      end
    end
  end
end
