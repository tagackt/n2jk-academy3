class Notification < ApplicationMailer
  def report_posted(report)
    @post_user = report.user
    @report = report

    mail to: 'no-reply@sonicgarden.jp', bcc: @report.notification_to, subject: "[academy] #{@report.title}"
  end
end
