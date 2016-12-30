class User < ApplicationRecord

  enum role: [:default, :admin]

  def self.update_or_create(auth)
    user = User.find_by(uid: auth[:uid]) || User.new
    user.attributes = {
      provider:       auth[:provider],
      uid:            auth[:uid],
      name:           auth[:info][:name],
      email:          auth[:info][:email],
      first_name:     auth[:info][:first_name],
      last_name:      auth[:info][:last_name],
      image:          auth[:info][:image],
      urls:           auth[:info][:urls],
      token:          auth[:credentials][:token],
      refresh_token:  auth[:credentials][:refresh_token],
      expires_at:     Time.at(auth[:credentials][:expires_at].to_i).to_datetime,
      expires:        auth[:credentials][:expires],
    }
    user.save!
    user
  end
end
