class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, foreign_key: 'author_id', dependent: :destroy
  has_many :likes, foreign_key: 'author_id', dependent: :destroy
  has_many :comments, foreign_key: 'author_id', dependent: :destroy
  after_initialize :init

  validates :name, presence: true
  validates :posts_counters, comparison: { greater_than_or_equal_to: 0 }, numericality: { only_integer: true }

  ROLES = %i[admin default].freeze

  has_secure_password

  def most_recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  def as_json(_options = {})
    super(only: %i[name posts_counters bio])
  end

  private

  def init
    self.posts_counters ||= 0
  end
end
