# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Project.create(
  [
    {
      name: 'VSCode',
      description: 'Code Editing. Redefined!'
    },
    {
      name: 'Atom',
      description: 'A hackable text editor for the 21st Century'
    },
    {
      name: 'A very, very, very, very, very, very, very, very, very long project name',
      description: 'A not so long descript though!'
    }
  ]
)

Ticket.create(
  [
    {
      name: 'Issues with auto-formatting code',
      description: 'Auto-formatting not working with PHP files.',
      project_id: 3
    },
    {
      name: 'Freezing when saving a Javascript file.',
      description: 'The EDI freezes when saving a .js file. Restarted need to open the EDI again.',
      project_id: 3
    },
    {
      name: 'Not recognising colour theme',
      description: 'Monokai theme not display correctly when using app. Reverts to original theme.',
      project_id: 3
    }
  ]
)
