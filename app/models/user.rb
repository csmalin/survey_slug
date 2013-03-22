class User < ActiveRecord::Base
 
  has_many :posts
  has_many :comments
  has_many :post_votes
  has_many :comment_votes
  validates :password_hash, :presence => true
  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(pass)
    @password = Password.create(pass)
    self.password_hash = @password
  end

  def self.authenticate(test_user)
    user = User.find_by_name(test_user['name'])
    return user if user && (user.password == test_user['password'])
    nil 
  end

end
