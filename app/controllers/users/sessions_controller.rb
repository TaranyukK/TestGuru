# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  def create
    super
    flash[:notice] = t('controllers.sessions.hello', full_name: resource.full_name)
  end
end
