class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Post
    can :read, Comment

    return unless user.present?

    can :manage, Post, author: user
    can :create, Comment
    can :manage, Comment, author: user

    return unless user.admin?

    can :manage, :all
  end
end
