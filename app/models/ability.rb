class Ability
  include CanCan::Ability

  def initialize(user)
	  user ||= User.new # guest user (not logged in)
      if user.role_id == 1 #'admin'
        can :manage, :all
      elsif user.role_id == 2 #'something else'
        # Rule him
      else
        # Rule him
      end
    end
end
