class Report < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :resource

  acts_as_readable :on => :created_at
end
