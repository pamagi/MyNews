class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all do |object|
      not object.respond_to?(:visible_to?) or object.visible_to?(user)
    end

    can :update, :all do |object|
      not object.respond_to?(:editable_by?) or object.editable_by?(user)
    end

    can :destroy, :all do |object|
      not object.respond_to?(:deletable_by?) or object.deletable_by?(user)
    end
  end
end
