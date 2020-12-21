class CreateProjects < ActiveRecord::Migration[6.1]
  def up
    create_table :projects do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def down
    drop_table :projects
  end
end
