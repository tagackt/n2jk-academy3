class SessionsController < ApplicationController
  def create
    auth = request.env['omniauth.auth']
    @user = User.find_by(uid: auth[:uid]) || User.create_with_github(auth)
    sign_in_and_redirect @user, :event => :authentication
  end
end
