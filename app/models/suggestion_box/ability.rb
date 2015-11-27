module SuggestionBox
  class Ability
    include ::CanCan::Ability

    def initialize(user)
      return if user.nil?

      can :read, :all
      can :manage, Suggestion, user_id: user.id
      can :manage, Comment, user_id: user.id
      if user.send(SuggestionBox.admin_check || 'position').to_s == (SuggestionBox.admin_value || 'chief')
        can :manage, :all
      end
    end
  end
end
