# frozen_string_literal: true

class CreateTickets < ActiveRecord::Migration[6.1]
  def up
    create_table :tickets do |t|
      t.string :name
      t.text :description
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_table :tickets
  end
end
