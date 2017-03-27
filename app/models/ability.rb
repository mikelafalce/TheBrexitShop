class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new # guest user (not logged in)

    if user.is_admin?
      can :manage, :all
    end

    # can :manage, Review do |review|
    #   review.user == user
    # end

  end
end
