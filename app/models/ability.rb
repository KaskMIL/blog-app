class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Post, published: true

    return unless user.present?

    can :read, Post, author: user
    can :update, Post, author: user
    can :create, Post, author: user
    can :destroy, Post, author: user

    return unless user.admin?

    can :manage, :all
  end
end
