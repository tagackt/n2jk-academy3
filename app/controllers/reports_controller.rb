class ReportsController < ApplicationController
  def create
    @report = current_user.reports.build(report_params)

    respond_to do |format|
      if @report.save
        @user = @report.user
        @reports = @user.reports
        format.js { render 'users/show' }
      else
        format.js
      end
    end
  end

  # Only allow a trusted parameter "white list" through.
  def report_params
    params.require(:report).permit(:body)
  end
end
