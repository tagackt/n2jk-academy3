class User < ActiveRecord::Base
  acts_as_reader
  has_many :reports, -> { order(created_at: :desc) }
  has_many :comments

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  def self.create_with_github(auth)
    User.create!(
        uid: auth[:uid],
        name: auth[:info][:name] || auth[:info][:nickname],
        email: auth[:info][:email] || 'sample@sample.com',
        password: Devise.friendly_token[0,20],
        image: auth[:info][:image],
        auth_hash: auth
    )
  end

end
