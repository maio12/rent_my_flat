# class ApartmentPolicy < ApplicationPolicy
#   class Scope < Scope
#     def resolve
#       scope.all
#     end

#     def index
#       @restaurants = policy_scope(Restaurant).order(created_at: :desc)
#     end

#     def create?
#       true
#     end

#     def update?
#       record.user == user
#     end

#     def destroy?
#       record.user == user
#     end
#   end
# end
