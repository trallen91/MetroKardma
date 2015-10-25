class User::SessionsController < Devise::SessionsController
  respond_to :json, :html
  def new
    @user = User.new
  end

  def create
    sign_out(:user) if current_user
    self.resource = warden.authenticate!(auth_options)
    set_flash_message(:notice, :signed_in) if is_flashing_format?
    sign_in(resource_name, resource)
    yield resource if block_given?
    respond_with resource, location: after_sign_in_path_for(resource)
  end

  def destroy
    log_out
    redirect_to login_path
  end

  private

  def session_params
    params.require(:session).permit(:username, :password)
  end
end