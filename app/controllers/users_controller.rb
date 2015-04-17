class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @reports = @user.reports

    #TODO 一気にreadにしたい・・・・
    @reports.each{ |r| r.mark_as_read! :for => current_user }

    # @reports.mark_as_read! :all, :for => current_user
    respond_to do |format|
      format.html
      format.js
    end
  end
end
