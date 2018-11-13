class Ability
  include CanCan::Ability

  def initialize(user)
    if User.current_role[0] == 'Администратор'
      can :manage, :all
    elsif User.current_role[0] == 'Оператор'
      can :read, Task
      can :read, Line
      can :my_edit, Line, :filial_id => User.current_role[2]
      can :update, Line, :filial_id => User.current_role[2]
      cannot :edit, Line
      can :manage, Reason do |reason|
        r = Line.all.where(("filial_id = ? AND verification = ?"), User.current_role[2], "false").ids
        r.include?(reason.line_id)
      end
      can :create, Reason
    elsif User.current_role[0] == 'Учебный Департамент'
      can :create, Task
      can :read, Task
      can :manage, Section
      can :manage, Line
      can :manage, Reason
      can :manage, Sourse
    end


    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
