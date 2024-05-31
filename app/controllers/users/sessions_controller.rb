# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  def create
    super
    flash[:notice] = "Hello, #{resource.full_name}!"
  end
end
