# frozen_string_literal: true

# Pundit Policy for Tickets
class TicketPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    user.try(:admin?) || record.project.has_member?(user)
  end

  def create?
    user.try(:admin?) ||
      record.project.has_manager?(user) ||
      record.project.has_editor?(user)
  end
end
