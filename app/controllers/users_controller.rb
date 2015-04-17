class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @reports = @user.reports.order(created_at: :desc)

    #TODO 一気にreadにしたい・・・・
    @reports.each do |report|
      report.mark_as_read! :for => current_user
    end
    # @reports.mark_as_read! :all, :for => current_user
    respond_to do |format|
      format.html
      format.js
    end
  end
end
