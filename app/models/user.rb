class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :blogs
  has_many :comments
  has_many :banners

  ROLES = %w[admin user].freeze

 #  def has_role?(admin)
 #  	roles.include?(admin)
	# end

	# def admin?
 #  	self.role.name == "Admin"
	# end

	# def author?
 #  	self.role.name == "Seller"
	# end

end
