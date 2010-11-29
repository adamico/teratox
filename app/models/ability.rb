class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can :manage, :all
      can :evoluer, Dossier
      can :names, [Produit, Correspondant]
      can :libelles, [Malformation, Pathologie]
    else
      can :read, :all
    end
  end
end
