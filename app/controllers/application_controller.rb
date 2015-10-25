class ApplicationController < ActionController::Base
  #
  # reenable when on production
  # protect_from_forgery with: :exception

  respond_to :json

  # not sure if we need these below but im keeping just in case

  #after_filter :set_csrf_cookie_for_ng

  #def set_csrf_cookie_for_ng
  #  cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  #end

  def angular
    render 'layouts/application'
  end

  protected

  def verified_request?
    super || valid_authenticity_token?(session, request.headers['X-XSRF-TOKEN'])
  end

end
