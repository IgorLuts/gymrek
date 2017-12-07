class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      can :read, Order, user: user
    end
  end
end
