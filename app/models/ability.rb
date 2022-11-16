class Ability
  include CanCan::Ability

  def initialize(user)

    return unless user.present?
    can :delete, Post, user_id: user.id
    can :delete, Comment, user_id: user.id

    return unless user.role == 'admin'
    can :manage, Post
    can :manage, Comment
  end 

end
