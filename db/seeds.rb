# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unless User.exists?(email: 'admin@email.com')
  User.create!(
    {
      id: 998,
      email: 'admin@email.com',
      password: 'Password123',
      password_confirmation: 'Password123',
      admin: true
    }
  )
end

unless User.exists?(email: 'viewer@email.com')
  User.create!(
    {
      id: 999,
      email: 'viewer@email.com',
      password: 'Password123',
      password_confirmation: 'Password123'
    }
  )
end

['VSCode', 'Atom', 'Brackets', 'RubyMine', 'TextMate', 'Sublime Text', 'A very, very, very, very, very, very, very, very, very long project name'].each do |name|
  unless Project.exists?(name: name)
    Project.create!(name: name, description: "A simple sample project about #{name}")
  end
end

Ticket.create(
  [
    {
      name: 'Issues with auto-formatting code',
      description: 'Auto-formatting not working with PHP files.',
      project_id: Project.first.id,
      author_id: 999
    },
    {
      name: 'Freezing when saving a Javascript file.',
      description: 'The EDI freezes when saving a .js file. Restarted need to open the EDI again.',
      project_id: Project.first.id,
      author_id: 998
    },
    {
      name: 'Not recognising colour theme',
      description: 'Monokai theme not displaying correctly when using app. Reverts to original.',
      project_id: Project.first.id,
      author_id: 998
    }
  ]
)
