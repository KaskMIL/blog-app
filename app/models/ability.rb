class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Post, published: true
    can :read, Comment, published: true

    return unless user.present?

    can :manage, Post, author: user
    can :create, Comment
    can :manage, Comment, author: user

    return unless user.admin?

    can :manage, :all
  end
end
