#---
# Excerpted from "Agile Web Development with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails4 for more book information.
#---
class ApplicationController < ActionController::Base
  before_filter :set_i18n_locale_from_params
  # ...
  before_filter :authorize
  before_filter :require_admin
  protect_from_forgery

  private

    def current_cart 
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    end

    # ...

  protected

    def authorize
      if request.format == Mime::HTML 
        unless User.find_by_id(session[:user_id])
          redirect_to login_url, notice: "Please log in"
        end
      else
        authenticate_or_request_with_http_basic do |email, password|
          user = User.find_by_email(email)
          user && user.authenticate(password)
        end
      end
    end
    
    def require_admin
      @user = User.find_by_id(session[:user_id])
      unless @user.user_type == "admin"
        redirect_to login_url, :notice=> "You don't have the authority for this page. Try to login as administrator "
      end
    end

    def set_i18n_locale_from_params
      if params[:locale]
        if I18n.available_locales.include?(params[:locale].to_sym)
          I18n.locale = params[:locale]
        else
          flash.now[:notice] = 
            "#{params[:locale]} translation not available"
          logger.error flash.now[:notice]
        end
      end
    end
    def default_url_options
      { locale: I18n.locale }
    end
end
