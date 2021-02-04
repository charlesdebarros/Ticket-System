# frozen_string_literal: true

# It link together the user, a name of a role, and a project
module AuthorisationHelpers
  def assign_role!(user, role, project)
    Role.where(user: user, project: project).delete_all
    Role.create!(user: user, role: role, project: project)
  end
end

# This makes the module above available to specs
RSpec.configure do |c|
  c.include AuthorisationHelpers
end
