class Ability
  include CanCan::Ability

  def initialize(user)
    # Admin
    if user.role == 'admin'
      can :manage, :all
    # Normal user
    else
      can :delete, Post, user_id: user.id
      can :delete, Comment, user_id: user.id
    end
    # Everyone
    can :read, Post
    can :read, Comment
  end
end
