class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    user_movies_path
  end

  def after_sign_out_path_for(resource_or_scope)
  	root
  end
end