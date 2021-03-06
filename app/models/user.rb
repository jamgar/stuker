class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  validates_presence_of :time_zone
  
  has_many :connection, dependent: :destroy
  has_many :posts, dependent: :destroy
  
  def facebook
    self.connection.where(provider: "facebook").first
  end
  
  def twitter
    self.connection.where(provider: "twitter").first
  end
end
