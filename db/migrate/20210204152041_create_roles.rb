# frozen_string_literal: true

class CreateRoles < ActiveRecord::Migration[6.1]
  def up
    create_table :roles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :role
      t.references :project, null: false, foreign_key: true

      t.timestamps null: false
    end
  end

  def down
    drop_table :roles
  end
end
