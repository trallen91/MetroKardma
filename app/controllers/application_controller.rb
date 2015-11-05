class ApplicationController < ActionController::Base
  #
  # reenable when on production

  respond_to :json

  def angular
    render 'layouts/application'
  end

  protected

  def verified_request?
    super || valid_authenticity_token?(session, request.headers['X-XSRF-TOKEN'])
  end

end
