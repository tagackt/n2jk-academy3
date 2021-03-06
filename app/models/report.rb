class Report < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :resource

  acts_as_readable on: :created_at

  after_save :mark_as_read_for_posted_user

  def title
    body.lines.first
  end

  def body_without_title
    body.lines.map{|line| line.gsub("^\r\n", '').presence}.compact.drop(1).join("\r\n")
  end

  def notification_to
    User.where.not(id: user.id).pluck(:email)
  end

  def notify_other_users
    return if notification_to.blank?
    Notification.report_posted(self).deliver!
  end

  def mark_as_read_for_posted_user
    mark_as_read!(for: user)
  end
end
